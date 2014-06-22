class CouncilMember < ActiveRecord::Base
  has_many :committee_members
  has_many :committees, through :committee_members
end
