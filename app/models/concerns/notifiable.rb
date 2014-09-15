module Notifiable
  extend ActiveSupport::Concern

  included do
    before_validation :generate_code
    before_validation :downcase_code
    validates :code, presence: true, uniqueness: true

    def email_notify(job_runtime)
      return unless (items = agenda_items.since(job_runtime)).any?
      subscriptions.email.digest(false).includes(:user).find_each do |sub|
        SubscriberMailer.agenda_item_update(self, items, sub.user).deliver
      end
    end

    def sms_notify(agenda_item)
      return unless Rails.configuration.twilio_account_sid
      client = Twilio::REST::Client.new(Rails.cofiguration.twilio_sid, Rails.configuration.twilio_auth_token)
      subscriptions.sms.includes(:sms_user).find_each do |sub|
        client.account.messages.create(
            from: Rails.configuration.twilio_number,
            to: sms_user.phone,
            body: "Something happened with #{self.display_name}"
          )
      end
    end

    def downcase_code
      self.code = self.code.upcase
    end

    def generate_code
      #blah
    end
  end

end
