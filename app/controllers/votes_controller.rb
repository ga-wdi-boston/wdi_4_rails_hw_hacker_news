class VotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @votable = votable
    @vote = Vote.new(vote_params)
  end

  def create
    @votable = votable
    @vote = Vote.new
    @vote.user = current_user
    @vote.votable = @votable

    @vote.save!
    redirect_to root_path
  end

  def destroy
    Vote.find(params[:id]).destroy!
    redirect_to root_path
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :votable_id, :votable_type)
  end

  def votable
    votable_type.camelize.constantize.find(votable_id)
  end

  def votable_id
    params["#{votable_type}_id"]
  end

  def votable_type
    %w(article comment).detect{ |type| params["#{type}_id"].present? }
  end
end
