class ConfirmationMailer < Devise::Mailer
  default from: "from@example.com"

  def confirmation_instructions(user, token, opts={})
    @user              = user
    @token             = token
    mail(to: user.email, subject: "[OurCity] Welcome to OurCity (action required)")
  end
end
