# frozen_string_literal: true

class Settings::EmailsController < ApplicationController
  before_action :set_user

  def show
    render Views::Settings::Email.new(user: @user)
  end

  def update
    return redirect_to settings_email_path, alert: "User is marked as readonly." if @user.email == User::READONLY_EMAIL

    if @user.update(user_params)
      redirect_to_success
    else
      render Views::Settings::Email.new(user: @user), status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = Current.user
  end

  def user_params
    params.permit(:email, :password_challenge).with_defaults(password_challenge: "")
  end

  def redirect_to_success
    if @user.email_previously_changed?
      resend_email_verification
      redirect_to settings_email_path, notice: "Your email has been changed"
    else
      redirect_to settings_email_path
    end
  end

  def resend_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
