class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    if current_user.admin?
      @post = Post.new
    else
      redirect_to posts_url, alert: "Not authorized."
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to posts_url, notice: "Post was successfully destroyed."
    else
      redirect_to posts_url, alert: "Not authorized."
    end

  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
