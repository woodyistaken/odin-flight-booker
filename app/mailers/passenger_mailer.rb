class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"
  def confirm_email(user)
    @user=user
    mail(to: @user.email, subject: "Confirm booking")
  end
end
