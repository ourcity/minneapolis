module Notifiable
  extend ActiveSupport::Concern

  included do
    validates :code, presence: true, uniqueness: true

    def notify(agenda_item)
      subscriptions.digest(false).find_each do |sub|
        SubscriberMailer.agenda_item_update(self, agenda_item, sub.user).deliver
      end
    end

    def create_tms_keyword
      return unless Rails.configuration.tms_api_key

      client = TMS::Client.new(Rails.configuration.tms_api_key, api_root: Rails.configuration.tms_api_root)

      keyword = client.keywords.build(name: self.code)
      keyword.post


      command = keyword.commands.build(
          name:         "subscribe to #{self.code}",
          params:       {url: Rails.application.routes.sms_subscription_url, http_method: "post"},
          command_type: :forward)
      command.post
    rescue TMS::Errors::InvalidPost => e
      logger.warn("Didn't create keyword for #{self.to_s}: #{e.message}")
    end
  end

end
