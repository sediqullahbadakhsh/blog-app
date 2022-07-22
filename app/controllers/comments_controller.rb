class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: current_user.id, post_id: @post.id, text: params[:text])
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      render :show, alert: 'Error occured!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
