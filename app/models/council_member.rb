class CouncilMember < ActiveRecord::Base
  extend FriendlyId

  has_many :committee_members
  has_many :committees, through: :committee_members
  friendly_id :slug_candidates, use: :slugged

  def full_name
    [first_name, last_name].join(' ')
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
end
