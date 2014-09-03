class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :subscriptions
  has_one   :location

  def subscribe(subscribable)
    sub = self.subscriptions.create!(subscribable: subscribable)
  rescue ActiveRecord::RecordInvalid => e
    return sub
  end

  def password_required?
    if persisted?
      !password.nil? || !password_confirmation.nil?
    else
      false
    end
  end
end
