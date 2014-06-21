class AgendaItem < ActiveRecord::Base
  belongs_to :issue
  has_many :report_links
end
