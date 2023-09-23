class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments, each_serializer: CommentSerializer
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = @user
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end
end
