class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      flash[:success] = 'Like posted !!!'
    else
      flash[:error] = 'Error: Like not posted!'
    end

    redirect_to user_post_path(@post.author, @post)
  end
end
