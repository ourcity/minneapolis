class PagesController < ApplicationController
  def index
  	@council_members = CouncilMember.all
  end

  def about
  end
end
