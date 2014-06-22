class Issue < ActiveRecord::Base
  has_many :agenda_items
  has_many :process_steps, through :agenda_items

end
