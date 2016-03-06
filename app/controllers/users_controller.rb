class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

end
