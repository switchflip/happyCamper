class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_valid_user

  def require_valid_user
    if logged_in? && !current_user.valid?
      redirect_to edit_user_path(current_user.id) unless params[:controller] = 'users' && ['edit', 'update'].include?(params[:action])
    end
  end

end
