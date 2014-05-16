class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voteable, only: [:create]
  def index
    @votes = Vote.all
  end

  def create
    @vote = @voteable.votes.new(vote_params)
    @vote.user_id = current_user.id
    @vote.save
    if params[:voteable] == 'comment'
      redirect_to @voteable.article
    else
      redirect_to articles_path
    end
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
