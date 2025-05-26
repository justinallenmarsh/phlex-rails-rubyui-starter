# frozen_string_literal: true

class Settings::SessionsController < ApplicationController
  def index
    sessions = Current.user.sessions.order(created_at: :desc)

    render Views::Settings::Sessions.new(sessions:)
  end
end
