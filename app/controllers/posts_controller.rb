class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: sessions[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @new_comm = Comment.new
    @comments = @post.comments
  end

  def create
    @post = Post.create(
      content: params[:post][:content],
      user_id: session[:user_id]
    )

    redirect_to posts_path
  end

  def new
    @post = Post.new
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end
