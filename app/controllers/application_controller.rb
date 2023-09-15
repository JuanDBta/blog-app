class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.first # This retrieves the first user from the database
  end
  helper_method :current_user
end
