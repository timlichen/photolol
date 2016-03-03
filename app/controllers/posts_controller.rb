class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  # Controller to manage edit view
  def edit
  end

  # Controller that handle updating logic
  def update
    if @post.update(post_params)
      flash[:success] = "Post updated successfully!"
      redirect_to(post_path(@post))
    else
      flash[:alert] = "You post couldn't be updated! Check the form and try again!"
      redirect_to :edit
    end
  end

  # Deletes post
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  # Using the data in out form for submission
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "You post has been created successfully."
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created. Check the form and try again."
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
