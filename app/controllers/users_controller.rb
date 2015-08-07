class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    # @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def update
    @user = User.new
    if @user.update(user_params)
      redirect_to edit_user_paths
    else 
      render :edit
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
