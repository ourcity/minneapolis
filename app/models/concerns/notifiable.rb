module Notifiable
  extend ActiveSupport::Concern

  included do
    # this borks the csv import via rake db:seed
    #validates :code, presence: true, uniqueness: true

    def notify(agenda_item)
      subscriptions.digest(false).find_each do |sub|
        SubscriberMailer.agenda_item_update(self, agenda_item, sub.user).deliver
      end
    end

    after_validation :sync_sms_keyword

    def sync_sms_keyword
      return unless Rails.configuration.tms_token.present? && code_changed?

      logger.info("syncing #{self.display_name} with TMS")

      client  = TMS::Client.new(Rails.configuration.tms_token,
          api_root: Rails.configuration.tms_root,
          logger: self.logger)
      keyword = client.keywords.build(name: self.code)
      keyword.post!

      command = keyword.commands.build(
          name:         "subscribe to #{self.code}",
          params:       {url: Rails.application.routes.url_helpers.sms_subscriptions_url, http_method: "post"},
          command_type: :forward)
      command.post!
    rescue TMS::Errors::InvalidPost => e
      logger.warn("Didn't create keyword for #{self.to_s}: #{e.message}")
    end
  end

end
