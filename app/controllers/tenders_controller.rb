class TendersController < ApplicationController
  def new
    @tender = Post.tender.new
  end

  def create
  end

  def show
  end

  # private
  # def tender_params
  #   params.require(:tender).permit()
  # end
end
