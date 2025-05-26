# frozen_string_literal: true

class Settings::ProfilesController < ApplicationController
  before_action :set_user

  def show
    render Views::Settings::Profile.new(user: @user)
  end

  def update
    binding.irb
    if @user.update(user_params)
      redirect_to settings_profile_path, notice: "Your profile has been updated"
    else
      redirect_to settings_profile_path
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
