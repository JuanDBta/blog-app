class CommentsController < ApplicationController
  before_action :set_user_post
  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment created !!!'
      redirect_to user_post_path(@post.author, @post)
    else
      # error message
      flash.now[:error] = 'Error: Comment not saved'
      # render new
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_post
    @user = current_user
    @post = Post.find(params[:post_id])
  end
end
