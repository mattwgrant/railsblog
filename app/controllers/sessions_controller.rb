class SessionsController < ApplicationController
  def new
    

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
      session[:current_user_id] = @user.id
        redirect_to users_path
    else @user && @user.password != params[:password]
      redirect_to sessions
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session_path
  end
end
