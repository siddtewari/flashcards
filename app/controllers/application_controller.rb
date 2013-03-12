class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	if cookies[:user_id] # don't need to encrypt here
  		User.find_by_id(cookies.signed[:user_id]) #here we need to decrypt
  	end
  end
  helper_method :current_user

  def signed_in? #all the question mark is tells you and fellow developers 
  	#that you are expecting truthy or falsy, an ! represents destructive
  	current_user
  end
  helper_method :signed_in?

  def require_login
  	unless signed_in?    #unless is essentialy if not
  		redirect_to new_session_path
  	end
  end
end
