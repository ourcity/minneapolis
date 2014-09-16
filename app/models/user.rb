class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :subscriptions
  has_one :location
  scope :digest, -> { joins(:subscriptions).where('subscriptions.digest' => true) }

  def subscribe(subscribable, notify=false)
    self.subscriptions.where(subscribable: subscribable).first_or_create(notify: notify)
  end

  def password_required?
    if persisted?
      !password.nil? || !password_confirmation.nil?
    else
      false
    end
  end

  def digest_subscriptions
    self.subscriptions.digest(true).
      includes(subscribable: :agenda_items).
      order("subscriptions.subscribable_type != 'Issue', subscriptions.subscribable_type != 'Committee'")
  end

  def deliver_agenda_digest(end_time, interval=24.hours, begin_time = (end_time - interval))
    def self.notify_digest
      User.digest.each do |user|
        next unless (items = AgendaItem.for(user).between(begin_time, end_time)).any?
        SubscriberMailer.deliver_agenda_item_digest(user, items.order('created_at DESC'))
      end
    end
  end
end
