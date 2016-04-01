class VotesController < ApplicationController
  before_action :set_post, only: [:create, :new, :index]
  before_action :add_post, only: [:destroy]

  def index
    @votes = @post.votes
  end

  def new
    @vote = @post.votes.new
  end

  def create
    @vote = @post.votes.new(vote_params)
    @vote.name = current_user.name
    @vote.user_id = current_user.id
    @money = current_user.money
    @money_params = vote_params[:money].to_i
    if @money > @money_params
      @money -= @money_params
      current_user.update_attribute(:money, @money)
      if @vote.save
        redirect_to post_path(@post)
      else
        flash[:error] = 'Ви Вже голосували'
        render post_path(@post)
      end
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @vote = @post.votes.find(params[:id])
    if current_user.update_attribute(:money, current_user.money += @vote.money)
      @vote.money = nil
    end
    @vote.destroy
    redirect_to post_path(@post)
  end

  private

  def vote_params
    params.require(:vote).permit(:money)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def add_post
    @post = Post.find(params[:post_id])
    @vote = @post.votes.find(params[:id])
    # @post = current_user.posts.find(params[:id])
  end
end
