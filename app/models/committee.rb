class Committee < ActiveRecord::Base
  extend FriendlyId

  has_many :agenda_items
	has_many :committee_members
	has_many :council_members, through: :committee_members

  friendly_id :name, use: :slugged

end
