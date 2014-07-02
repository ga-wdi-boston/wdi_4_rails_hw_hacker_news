class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new(user: current_user, voteable: voteable, is_up: params[:id])

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
    %w(comment article).detect{ |type| params["#{type}_id"].present? }
  end
end
