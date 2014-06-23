class AgendaItem < ActiveRecord::Base
  belongs_to :issue
  belongs_to :process_step
  belongs_to :committee
  has_many :report_links
  belongs_to :committee
  belongs_to :council_member

  validates :committee, presence: true
end
