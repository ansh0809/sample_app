class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      user.update_attribute(:last_seen , DateTime.now)
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    current_user.update_attribute(:last_seen, DateTime.now - 600)
  	session[:user_id] = nil
  	flash[:success] = "User successfully Logged out!"
  	redirect_to root_url
  end
end