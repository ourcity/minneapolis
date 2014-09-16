class Subscription < ActiveRecord::Base

  SMS_STOP_WORDS = %w(stop stopall unsubscribe cancel end quit)

  belongs_to :user
  belongs_to :sms_user

  belongs_to :subscribable, polymorphic: true
  validates :subscribable, presence: true
  validates :user_id, :uniqueness => {:scope => [:subscribable_type, :subscribable_id]}
  validates :sms_user_id, :uniqueness => {:scope => [:subscribable_type, :subscribable_id]}
  attr_accessor :notify
  delegate :display_name, to: :subscribable

  scope :digest, -> (digested) { where(digest: digested) }
  scope :sms, -> { where('sms_user_id IS NOT NULL') }
  scope :email, -> { where('user_id IS NOT NULL') }

  SUBSCRIBABLE_TYPES = [Issue, Committee, CouncilMember]

  validate :has_user?
  validate :check_subscribable_type

  after_create :send_notification, if: :notify

  protected

  def check_subscribable_type
    errors.add(:subscribable, 'is invalid') unless SUBSCRIBABLE_TYPES.include?(subscribable.class)
  end

  def send_notification
    return unless user.try(:confirmed?)
    SubscriberMailer.quick_subscribe_confirm(user, self).deliver
  end

  def has_user?
    (sms_user || user).try(:persisted?)
  end

end
