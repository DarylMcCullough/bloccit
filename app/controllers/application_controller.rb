class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
     include SessionsHelper
     
  def my_url() 
    return "https://bloc-global-assets.s3.amazonaws.com/images-rails/bloccit-authentication-login/avatar.png"
  end
     
  def avatar_url(user)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
end
