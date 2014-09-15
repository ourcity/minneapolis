class SmsSubscriptionsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid do
    render plain: "Sorry, couldn't subscribe you to OurCity items."
  end

  def create
    unsubscribe! and return if Subscription::SMS_STOP_WORDS.any? { |t| sms_body.start_with?(t) }

    sms_user = SmsUser.where(phone: Phony.normalize(params['From'])).first_or_create!
    codes    = sms_body.split(' ')


    codes.each { |code| sms_user.subscribe(code) }

    if (count = sms_user.subscriptions.count) > 0
      render plain: "You are now subscribed to #{count} OurCity #{'item'.pluralize(count)}. Thanks!"
    else
      render plain: "Find subscription items at #{root_url}. 'STOP' to stop all updates."
    end
  end

  protected

  def sms_body
    @sms_body ||= params['Body'].downcase.strip
  end

  def unsubscribe!
    SmsUser.where(phone: Phony.normalize(params['From'])).destroy_all
    render plain: "You will no longer receive updates from OurCity."
  end

end
