class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new
    vote.user = current_user
    vote.voteable = voteable
    vote.is_up = params[:is_up]

    vote.save!
    redirect_to :back
  end

  def update
    vote = Vote.find(params[:id])
    vote.update(is_up: !vote.is_up)

    vote.save!
    redirect_to :back
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy!
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
