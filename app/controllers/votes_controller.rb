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
    @vote.value = votable_value


    if Vote.exists?(user_id: current_user.id, votable_id: votable_id)
      @existing_vote = Vote.find_by(user_id: current_user.id, votable_id: votable_id)
      @existing_vote.value = votable_value
      @existing_vote.save!
      redirect_to root_path
    else
      @vote.save!
      redirect_to root_path
    end
  end

  def destroy
    Vote.find(params[:id]).destroy!
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :votable_id, :votable_type, :value)
  end

  def votable_value
    params[:value]
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
