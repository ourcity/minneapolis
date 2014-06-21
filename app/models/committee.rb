class Committee < ActiveRecord::Base
	has_many: committee_members
end
