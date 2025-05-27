# frozen_string_literal: true

class Settings::ProfilesController < ApplicationController
  before_action :set_user

  def show
    render Views::Settings::Profile.new(user: @user)
  end

  def update
    return redirect_to settings_profile_path, alert: "User is marked as readonly." if @user.email == User::READONLY_EMAIL

    if @user.update(user_params)
      redirect_to settings_profile_path, notice: "Your profile has been updated"
    else
      render Views::Settings::Profile.new(user: @user), status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = Current.user
  end

  def user_params
    params.permit(:name)
  end
end
