# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]
  before_action :require_no_authentication, only: %i[new create]

  def new
    render Views::Users::New.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session_record = @user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: session_record.id, httponly: true }

      send_email_verification
      redirect_to dashboard_path, notice: "Welcome! You have signed up successfully"
    else
      render Views::Users::New.new(user: @user), status: :unprocessable_entity
    end
  end

  def destroy
    user = Current.user
    if user.authenticate(params[:password_challenge] || "")
      user.destroy!
      Current.session = nil
      redirect_to root_path, notice: "Your account has been deleted"
    else
      render Views::Settings::Profile.new(user:), status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
