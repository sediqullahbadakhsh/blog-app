class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy_comment
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comments.find(params[:format])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
