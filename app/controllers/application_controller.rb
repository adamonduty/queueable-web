class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_systems

  # Retreive the list of systems for the nav bar
  def get_systems
    @systems = Platform.systems
  end
end
