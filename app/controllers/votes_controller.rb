class VotesController < ApplicationController
before_action :set_voteable, only: [:create]
  def index
    @votes = Vote.all
  end

  def create
    @vote = @voteable.votes.new(vote_params)
    @vote.user_id = current_user.id
    @vote.save
    redirect_to articles_path
  end

  private

  def vote_params
    params.require(:vote).permit(:vote)
  end

  def set_voteable
    @voteable = params[:voteable].classify.constantize.find(voteable_id)
  end

  def voteable_id
    params[(params[:voteable] + "_id").to_sym]
  end

end
