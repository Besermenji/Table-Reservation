class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :warning, :danger, :info
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :restaurant_authorization
  helper_method :sys_admin_authorization

  rescue_from ActiveRecord::StaleObjectError, :with => :error_render_method

  def error_render_method
    respond_to do |type|
      type.all  { render :file => 'public/422.html', :status => :not_found}
    end
    true
  end

  def sys_admin_authorization
    redirect_to forbidden_acces_path unless current_role == 'sys_admin'
  end

  def restaurant_authorization(restaurant)
    redirect_to forbidden_acces_path unless current_role == 'sys_admin' || restaurant.managers.include?(current_user)
  end

  private
  def current_role
    if current_user
      current_user.roles.first.name
    else
      nil
    end
  end
end
