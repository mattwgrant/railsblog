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
        redirect_to user_path
        # for some reason, even though they are in my database,
        # when I login in it is redirecting to the path that
        # should occur with incorrect information
    else @user && @user.password != params[:password]
      redirect_to sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
