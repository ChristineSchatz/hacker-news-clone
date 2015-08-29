class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to :root
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end