class UserMailer < ApplicationMailer
include Devise::Mailers::Helpers

  default from: 'contact@whynotwillit.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.datasend.subject
  #
  def datasend(user)
    @user = user
    @greeting = "Your information from Willit"
    mail(to: @user.email, subject: 'Welcome to Willit')
  end

  def valuable_email(user)
    @user = user
    @valuables = @user.valuables
    @greeting = "Your Valuables from Willit"
    mail(to: @user.email, subject: 'Welcome to Willit')
  end

  def ceremony_email(user)
    @user = user
    @ceremony = @user.ceremony
    @greeting = "Your Ceremony from Willit"
    mail(to: @user.email, subject: 'Welcome to Willit')
  end

  def contact_email(user)
    @user = user
    @contacts = @user.contacts
    @greeting = "Your Ceremony from Willit"
    mail(to: @user.email, subject: 'Welcome to Willit')
  end

  def confirmation_instructions(record)
    devise_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record)
    devise_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record)
    devise_mail(record, :unlock_instructions)
  end
end
