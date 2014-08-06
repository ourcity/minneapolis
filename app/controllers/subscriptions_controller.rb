class SubscriptionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first_or_create
    @subscription = @user.subscribe(subscribable) if @user.persisted?
    respond_to do |format|
      format.js
    end
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
