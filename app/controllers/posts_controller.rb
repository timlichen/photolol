class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  # Using the data in out form for submission
  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  private

    # Here we define the exact data we want to accpet as the parameters.
    def post_params
      params.require(:post).permit(:image, :caption)
    end


end
