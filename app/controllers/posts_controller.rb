class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  # Controller to manage edit view
  def edit
    @post = Post.find(params[:id])
  end

  # Controller that handle updating logic
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  # Deletes post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # Using the data in out form for submission
  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  # Show a single post
  def show
    @post = Post.find(params[:id])
  end

  private

    # Here we define the exact data we want to accpet as the parameters.
    def post_params
      params.require(:post).permit(:image, :caption)
    end


end
