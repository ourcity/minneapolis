class Issue < ActiveRecord::Base
  extend FriendlyId

  has_many :agenda_items
  has_many :process_steps, through: :agenda_items
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :summary, presence: true

end
