class UsersController < ApplicationController
  
  def index
    current_user = User.find_by_id(session[:current_user_id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    redirect_to users_path
  end

  def edit
  end

  def destroy
  end

end
