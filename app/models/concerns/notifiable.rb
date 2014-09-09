module Notifiable
  extend ActiveSupport::Concern

  included do
    def notify(agenda_item)
      subscriptions.digest(false).find_each do |sub|
        SubscriberMailer.agenda_item_update(self, agenda_item, sub.user).deliver
      end
    end
  end

end