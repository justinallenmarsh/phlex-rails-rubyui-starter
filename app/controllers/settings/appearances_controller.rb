# frozen_string_literal: true

class Settings::AppearancesController < ApplicationController
  def show
    render Views::Settings::Appearance.new
  end
end
