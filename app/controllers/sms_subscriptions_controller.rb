class SmsSubscriptionsController < ApplicationController

  def create
    @user = SmsUser.where(phone: params[:from]).first_or_initialize
    if @user.subscribe(params[:body])
      render nothing: true, status: 204
    else
      render json: {error: @user.errors.full_messages}, status: 422
    end

  end
  
  before_filter :find_code, :find_user

  def create
    @codes.each do |code|
      @sms_user.send(@action, code)
    end
    render nothing: true, status: 201
  end

  protected
  def render_unknown
    render text: "'SUBSCRIBE <CODE>' to subscribe. 'UNSUBSCRIBE <CODE>' to unsubscribe. 'STOP' to stop all updates. Find subscription items at #{root_url}.", status: 202
    false
  end

  def find_user
    scope = SmsUser.where(phone: params[:from])
    if @action=='unsubscribe'
      render_unknown and return false unless scope.any?
    end
    @sms_user = scope.first_or_create
  end

  def find_code
    @codes  = params[:sms_body].downcase.split(' ')
    @action = @codes.shift
    raise 'foo' unless ['subscribe', 'unsubscribe'].include?(@action)
    @codes.map(&:upcase!)
    @action.downcase!
  rescue => e
    logger.warn(e)
    render_unknown
  end

end
