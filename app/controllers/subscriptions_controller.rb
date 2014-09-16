class SubscriptionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first_or_create
    @subscription = @user.subscribe(subscribable, :notify) if @user.persisted?
    render layout: false
  end

  protected

  def subscribable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
