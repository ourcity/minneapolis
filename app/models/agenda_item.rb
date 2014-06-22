class AgendaItem < ActiveRecord::Base
  belongs_to :issue
  belongs_to :process_step
  has_many :report_links
  belongs_to :committee
  belongs_to :council_member
end
