module Notifiable
  extend ActiveSupport::Concern

  included do
    before_validation :generate_code
    before_validation :downcase_code
    validates :code, presence: true, uniqueness: true

    def email_notify(job_runtime)
      return unless Rails.configuration.tms_token && (items = agenda_items.since(job_runtime)).any?
      subscriptions.email.digest(false).includes(:user).find_each do |sub|
        SubscriberMailer.agenda_item_update(self, items, sub.user).deliver
      end
    end

    def sms_notify(job_runtime)
      return unless Rails.configuration.twilio_account_sid && (items = agenda_items.since(job_runtime)).any?
      subscriptions.sms.includes(:sms_user).find_each do |sub|
        tms_client.account.messages.create(
            from: Rails.configuration.twilio_number,
            to: sms_user.phone,
            body: "#{self.display_name} updated!"
          )
      end
    end

    protected

    def downcase_code
      self.code = self.code.upcase
    end

    def generate_code
      # do nothing by default
    end

    def tms_client
      @tms_client ||= TMS::Client.new(Rails.configuration.tms_token,
          api_root: Rails.configuration.tms_root,
          logger: Rails.logger)

    end

    def twilio_client
      @twilio_client ||= Twilio::REST::Client.new(Rails.cofiguration.twilio_sid, Rails.configuration.twilio_auth_token)
    end
  end

end
