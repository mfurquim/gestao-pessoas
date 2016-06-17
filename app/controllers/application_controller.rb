class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  # Authorization access to actions controller based in role of user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    
  def user_not_authorized(exception)
    puts exception
    render file: Rails.root.to_s+"/public/404.html", status: 404
  end
  private :user_not_authorized
end
