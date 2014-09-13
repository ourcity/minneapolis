class Subscription < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  belongs_to :subscribable, polymorphic: true
  validates :subscribable, presence: true
  validates :user_id, :uniqueness => {:scope => [:subscribable_type, :subscribable_id]}
  attr_accessor :notify
  delegate :display_name, to: :subscribable

  scope :digest, -> (digested) { where(digest: digested) }

  SUBSCRIBABLE_TYPES = [Issue, Committee, CouncilMember]

  validate :check_subscribable_type

  after_create :send_notification, if: :notify

  protected

  def check_subscribable_type
    errors.add(:subscribable, 'is invalid') unless SUBSCRIBABLE_TYPES.include?(subscribable.class)
  end

  def send_notification
    SubscriberMailer.quick_subscribe_welcome(user, self).deliver
  end

end
