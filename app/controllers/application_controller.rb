# Main class of controllers to inheritance
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  # Authorization access to actions controller based in role of user
# TODO: Temporary removed to development
  #rescue_from Pundit::NotAuthorizedError, with: :render_404
  #rescue_from ActiveRecord::RecordNotFound, with: :render_404
  #rescue_from ActionController::UnknownController, with: :render_404
  #rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404(exception)
    puts '*' * 100
    puts exception.message
    puts '*' * 100
    render file: Rails.root.to_s + '/public/404', status: 404
  end
end
