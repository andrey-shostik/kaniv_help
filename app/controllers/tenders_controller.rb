class TendersController < ApplicationController
  before_action :set_post, only: [:create, :show]
  before_action :set_tender, only: [:show]

  def create
    @tender = Tender.new
    @tender.post_id = @post.id
    if @tender.save
      redirect_to  post_tender_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def show
    @votes = @tender.tender_votes
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_tender
    @post = Post.find(params[:post_id])
    @tender = @post.tender
  end

  # def tender_params
  #   params.require(:tender).permit()
  # end
end
