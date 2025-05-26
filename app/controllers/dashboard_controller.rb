# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    render Views::Dashboard::Index.new
  end
end
