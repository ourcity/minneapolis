class SmsUser < ActiveRecord::Base
  has_many :subscriptions

  phony_normalize :phone, default_country_code: 'US'
  validates_plausible_phone :phone, presence: true, default_country_code: 'US'

  def subscribe(code)
    self.subscriptions.where(subscribable: subscribable(code)).first_or_create
  end

  def unsubscribe(code)
    self.subscriptions.where(subscribable: subscribable(code)).first.try(:destroy)
  end

  protected
  def subscribable(code)
    for klass in Subscription::SUBSCRIBABLE_TYPES
      obj = klass.find_by_code(code.upcase)
      return obj if obj
    end
    nil
  end
end
