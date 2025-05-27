# frozen_string_literal: true

class Settings::PasswordsController < ApplicationController
  before_action :set_user

  def show
    render Views::Settings::Password.new(user: @user)
  end

  def update
    return redirect_to settings_password_path, alert: "User is marked as readonly." if @user.email == User::READONLY_EMAIL

    if @user.update(user_params)
      redirect_to settings_password_path, notice: "Your password has been changed"
    else
      render Views::Settings::Password.new(user: Current.user), status: :unprocessable_entity
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
