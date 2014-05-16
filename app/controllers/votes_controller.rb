class VotesController < ApplicationController
  before_action :set_votable

  def create
    binding.pry
    @vote = @votable.votes.new(value: vote_params[:score], user: current_user)
    if @vote.save
      redirect_to :back, { notice: 'Vote accepted. Thanks!' }
    else
      redirect_to :back
    end
  end


  private

    def vote_params
      params.require(:vote).permit(:score)
    end
    def set_votable
      @votable = params[:votable].classify.constantize.find(votable_id)
    end
    def votable_id
      params[(params[:votable] + "_id").to_sym]
    end
end

