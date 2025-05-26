class HomeController < ApplicationController
  def index
    render Views::Home::Index.new(user: Current.user)
  end
end
