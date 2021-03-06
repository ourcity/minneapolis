class CouncilMember < ActiveRecord::Base
  extend FriendlyId
  include Notifiable

  has_many :agenda_items
  has_many :committee_members
  has_many :committees, through: :committee_members
  has_many :events_attendees
  has_many :events, through: :event_attendees
  friendly_id :slug_candidates, use: :slugged
  has_many :subscriptions, as: :subscribable

  def full_name
    [first_name, last_name].join(' ')
  end

  def display_name
    "City Council Representative  #{self.full_name} (Ward #{self.ward})"
  end

  def homepage
    "http://www.minneapolismn.gov/ward#{self.ward}/index.htm"
  end

  def image_url
    # guess whose name is misspelt
    "http://www.minneapolismn.gov/www/groups/public/@council/documents/images/#{first_name.downcase.gsub('abdi', 'adbi')}-#{last_name.downcase}.jpg"
  end

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      [:first_name, :last_name],
      [:first_name, :last_name, :ward]
    ]
  end

  def generate_code
    return if self.code.present?
    if self.ward
      self.code||="WARD_#{ward}"
    else
      self.code||=[first_name[0], last_name].join
    end
  end
end
