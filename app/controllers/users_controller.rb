class UsersController < ApplicationController

  def index
    @users = User.where("last_seen >= ?", DateTime.now - 300)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @users = User.where("last_seen >= ?", DateTime.now - 300)
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User successfully created!"
      redirect_to signin_path
    else
      render 'new'
    end
  end
end
