class Subscription < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  belongs_to :subscribable, polymorphic: true
  validates :subscribable, presence: true
  validates :user_id, :uniqueness => { :scope => [:subscribable_type, :subscribable_id] }

  SUBSCRIBABLE_TYPES = [Issue, Committee, CouncilMember]

  validate :check_subscribable_type

  protected

  def check_subscribable_type
    errors.add(:subscribable, 'is invalid') unless SUBSCRIBABLE_TYPES.include?(subscribable.class)
  end

end
