class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new
    vote.user = current_user
    vote.voteable = voteable

    vote.save!
    redirect_to :back # Bounces user :back to path they came from
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
    %w(article).detect{ |type| params["#{type}_id"].present? }
  end
end
