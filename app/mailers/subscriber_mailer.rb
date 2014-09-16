class SubscriberMailer < ActionMailer::Base
  default from: "ourcitymn@gmail.com"

  def agenda_update(notifiable, agenda_items, user)
    @notifiable   = notifiable
    @agenda_items = agenda_items
    @user         = user
    mail(to: user.email, subject: '[OurCity] New Agenda Item Posted')
  end

  def agenda_digest(agenda_items, user)
    @agenda_items = agenda_items
    @user         = user
    mail(to: user.email, subject: "[OurCity] Agenda Item Digest - #{Date.today.to_formatted_s}")
  end

  def quick_subscribe_confirm(user, subscription)
    @user        = user
    @subscription=subscription
    mail(to: user.email, subject: "[OurCity] OurCity Account Confirmation")
  end

end
