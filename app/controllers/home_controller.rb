# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate
  before_action :perform_authentication

  def index
    render Views::Home::Index.new(user: Current.user)
  end
end
