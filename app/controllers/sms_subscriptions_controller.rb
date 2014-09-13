class SmsSubscriptionsController < ApplicationController

  def create
    @user = SmsUser.where(phone: params[:from]).first_or_initialize
    if @user.subscribe(params[:body])
      render nothing: true, status: 204
    else
      render json: {error: @user.errors.full_messages}, status: 422
    end

  end
end
