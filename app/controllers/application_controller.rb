class ApplicationController < ActionController::Base
	
  before_filter :authenticate_user!
  before_filter :testing
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def testing
    if user_signed_in?
      params[:sign_out] = 'Sign out'
      params[:profile]  = 'Profile'
      params[:users]    = 'Users'
    end
  end
end
