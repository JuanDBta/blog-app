class PostsController < ApplicationController
  load_and_authorize_resource
  layout 'application'
  before_action :set_user
  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created !!!'
          redirect_to user_posts_path(current_user)
        else
          # error message
          flash.now[:error] = 'Error: Post not saved'
          # render new
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    #authorize! :destroy, @post
  
    if @post.destroy
      flash[:success] = "Post deleted !!!"
    else
      flash[:error] = "Unable to delete post..."
    end
  
    redirect_to user_posts_path(current_user)
  end
  

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
