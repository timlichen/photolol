class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  # Controller to manage edit view
  def edit
  end

  # Controller that handle updating logic
  def update
    if @post.update(post_params)
      flash.now[:alert] = "Post updated successfully!"
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "You post couldn't be updated! Check the form and try again!"
      redirect_to posts_path
    end
  end

  # Deletes post
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  # Using the data in out form for submission
  def create
    if @post = Post.create(post_params)
      flash.now[:alert] = "You post has been created successfully."
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created. Check the form and try again."
      render :new
    end
  end

  # Show a single post
  def show
  end

  private

    # Here we define the exact data we want to accpet as the parameters.
    def post_params
      params.require(:post).permit(:image, :caption)
    end

    def set_post
      @post = Post.find(params[:id])
    end


end
