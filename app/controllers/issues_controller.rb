class IssuesController < ApplicationController

  def index
    @issue = Issue.all
  end

  def show
    @council_member = CouncilMember.order("RANDOM()").first
    @issue = Issue.friendly.find(params[:id])
  end
end

