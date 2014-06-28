class CommitteeMember < ActiveRecord::Base
  belongs_to :committee
  belongs_to :council_member

  def full_name
  	first_name + " " + last_name
  end
  
end
