class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.where(post_id: @post.id).order(created_at: :desc)
    @user = User.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html {render :new, locals: {post: @post}}
    end
  end

  
end
