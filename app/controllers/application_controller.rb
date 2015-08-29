class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end

   def require_login
    redirect_to :root unless is_authenticated?
  end

end