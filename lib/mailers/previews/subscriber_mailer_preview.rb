class SubscriberMailerPreview < ActionMailer::Preview

  def quick_subscribe_confirm
    @user=User.first
    SubscriberMailer.quick_subscribe_confirm(@user)
  end

  def agenda_update
    agenda_item = AgendaItem.order("RANDOM()").first
    SubscriberMailer.agenda_update(agenda_item.committee, agenda_item, User.first)
  end

  def agenda_digest
    agenda_items = AgendaItem.order("RANDOM()").limit(10)
    SubscriberMailer.agenda_digest(agenda_items, User.first)
  end

end