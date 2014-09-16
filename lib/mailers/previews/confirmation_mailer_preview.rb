class ConfirmationMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    @user=User.first
    ConfirmationMailer.confirmation_instructions(@user, 'tokie')
  end

end