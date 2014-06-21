class Issue < ActiveRecord::Base
  has_many :agenda_items
end
