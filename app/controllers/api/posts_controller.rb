class Api::PostsController < ApplicationController
  class Api::PostsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: %i[create destroy]
    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts

      render json: @posts, each_serializer: PostSerializer
    end

    def show
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:id])

      render json: @post, each_serializer: PostSerializer
    end

    def create
      @user = User.find(params[:user_id])
      @post = @user.posts.build(post_params)

      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      head :no_content
    end

    private

    def post_params
      params.require(:post).permit(:title, :text)
    end
  end
end
