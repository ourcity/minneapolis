class ConfirmationsController < Devise::ConfirmationsController

  def new
    super
  end

  def create
    super
  end

  def show
    super do |resource|
      SubscriberMailer.quick_subscribe_confirm(resource).deliver
    end
  end

  protected

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      signed_in_root_path(resource)
    else
      root_path
    end
  end
end