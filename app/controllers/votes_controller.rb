class VotesController < ApplicationController

  before_action :authenticate_user!, only: :create :destroy

  def create

    if current_user.vote_for(voteable).present?
      current_user.vote_for(voteable).destroy
    end

    @voteable = voteable
    @vote = current_user.votes.new
    @vote.score = params[:score]
    @vote.voteable = @voteable

    @vote.save!
    redirect_to :back
  end

  def destroy
    Vote.find(params[:id]).destroy!
    redirect_to :back
  end

  private

  def voteable
    voteable_type.camelize.constantize.find(voteable_id)
  end

  def voteable_id
    params["#{voteable_type}_id"]
  end

  def voteable_type
    %w(article comment).detect{ |type| params["#{type}_id"].present? }
  end

end
