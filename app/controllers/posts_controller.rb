class PostsController < ApplicationController
  layout 'application'
  before_action :set_user
  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
