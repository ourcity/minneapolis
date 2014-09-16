class Issue < ActiveRecord::Base
  extend FriendlyId
  include Notifiable

  has_many :agenda_items
  has_many :committees, -> { uniq }, through: :agenda_items
  has_many :conversations, as: :conversable
  has_many :council_members, -> { uniq }, through: :agenda_items
  has_many :process_steps, through: :agenda_items
  has_many :subscriptions, as: :subscribable

  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :summary, presence: true

  def display_name
    "Issue:  #{self.name}"
  end


end
