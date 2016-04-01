class CommentsController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.commenter = current_user.name
    if @comment.save
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'error'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_patt(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
