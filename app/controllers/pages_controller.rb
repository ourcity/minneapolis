class PagesController < ApplicationController

  def index
    @map = Map.where(name: "minneapolis-wards").first
  end

  def about
  end

  def process_steps
  end

  def calendar
  end

end
