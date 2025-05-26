# frozen_string_literal: true

class Settings::PasswordsController < ApplicationController
  before_action :set_user

  def show
    render Views::Settings::Password.new(user: @user)
  end

  def update
    if @user.update(user_params)
      redirect_to settings_password_path, notice: "Your password has been changed"
    else
      redirect_to settings_password_path, alert: "Password challenge is invalid"
    end
  end

  private

  def set_user
    @user = Current.user
  end

  def user_params
    params.permit(:password, :password_confirmation, :password_challenge).with_defaults(password_challenge: "")
  end
end
