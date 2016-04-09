class TenderVotesController < ApplicationController

  before_action :set_tender, only: [:new, :create, :destroy]

  def index
  end

  def new
    @vote = @tender.tender_votes.new
  end

  def create
    @vote = @tender.tender_votes.new(vote_params)
    @vote.name = current_user.name
    @vote.user_id = current_user.id
    @money = current_user.money
    @money_params = vote_params[:money].to_i
    if @money > @money_params
      @money -= @money_params
      current_user.update_attribute(:money, @money)
      if @vote.save
        redirect_to post_tender_path(@tender)
      else
        redirect_to post_tender_path(@tender)
      end
    else
      redirect_to post_tender_path(@tender)
    end
  end

  def destroy
    @vote = @tender.tender_votes.find(params[:id])
    if current_user.update_attribute(:money, current_user.money += @vote.money)
      @vote.money = nil
    end
    @vote.destroy
    redirect_to post_tender_path(@tender)
  end

  private

  def set_tender
    @post = Post.find(params[:post_id])
    @tender = @post.tender
  end

  def vote_params
    params.require(:tender_vote).permit(:money)
  end
end
