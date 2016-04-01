class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.all.page(params[:page])
     #@posts = current_user.posts
  end

  def new
    @post = Post.new
    #@post = current_user.posts.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    #@post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @votes = @post.votes
    @money = current_user.money
    @created_time = @post.created_at.strftime("%m.%d.%Y")
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
 #   binding.pry
    @post.delete
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def set_post
      @post = Post.find(params[:id])
       #@post = current_user.posts.find(params[:id])
    end
end
