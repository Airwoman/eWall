class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by(:id => session[:user_id])
    session[:user_id] = nil unless @current_user
  end

  def only_admin_action
    if @current_user.role != 1
      redirect_to(request.referer || root_path)
    end
  end

  def only_owner_action
    if @user != @current_user
      redirect_to(request.referer || root_path)
    end
  end
end
