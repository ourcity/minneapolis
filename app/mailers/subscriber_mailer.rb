class SubscriberMailer < ActionMailer::Base
  default from: "noreply@ourcity.com"

  def agenda_update(notifiable, agenda_item, user)
    @notifiable  = notifiable
    @agenda_item = agenda_item
    @user        = user
    mail(to: user.email, subject: '[OurCity] New Agenda Item Posted')
  end

  def agenda_digest(agenda_items, user)
    @agenda_items = agenda_items
    @user         = user
    mail(to: user.email, subject: "[OurCity] Agenda Item Digest - #{Date.today.to_formatted_s}")
  end

  def quick_subscribe_welcome(user, subscription)
    @user              = user
    @subscription      = subscription
    @subscription_desc = subscription.display_name
    mail(to: user.email, subject: "[OurCity] Welcome to OurCity (action required)")
  end

  def quick_subscribe_confirm(user, subscription)
    @user = user
    mail(to: user.email, subject: "[OurCity] OurCity Account Confirmation")
  end

end
