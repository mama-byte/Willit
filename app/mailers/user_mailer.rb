class UserMailer < ApplicationMailer
  default from: 'reyalsgears@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.datasend.subject
  #
  def datasend(user)
    @user = user
    @greeting = "Hello from Willit"
    mail(to: "dozornik88@gmail.com", subject: 'Welcome to Willit')
  end

  def valuable_email(user)
    @user = user
    @greeting = "Hello from Willit"
    mail(to: "dozornik88@gmail.com", subject: 'Welcome to Willit')
  end
end
