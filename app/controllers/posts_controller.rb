class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.where(post_id: @post.id).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path }
      else
        format.html { render :new }
      end
    end
  end
  def comment
    @post = Post.find(params[:id])
    @comment = Comment.new(author_id: current_user.id, post_id: @post.id, text: params[:comment])
    if @comment.save
      redirect_to user_post_path(current_user)
    else
      render :show, alert: 'Error occured!'
    end
  end
  
  def like
    @post = Post.find(params[:id])
    Like.new(author_id: current_user.id, post_id: @post.id).save
    redirect_to user_post_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
