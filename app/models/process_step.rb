class ProcessStep < ActiveRecord::Base
	has_many :agenda_items
	has_many :issues, through :agenda_items
end
