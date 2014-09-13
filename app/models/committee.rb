class Committee < ActiveRecord::Base
  extend FriendlyId

  has_many :events
	has_many :committee_members
	has_many :council_members, through: :committee_members
  has_many :subscriptions, as: :subscribable

  friendly_id :name, use: :slugged

  def display_name
    "City Council Committee: #{self.name}"
  end

end
