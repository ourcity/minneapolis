class PagesController < ApplicationController
  def index
  	@committee_members = CommitteeMember.all
  end

  def about
  end
end
