class Committee < ActiveRecord::Base
	has_many :committee_members
	has_many :council_members, through: :committee_members

end
