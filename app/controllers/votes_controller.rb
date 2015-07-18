class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @voteable = voteable
    @vote = Vote.new(vote: params[:vote])
    @vote.user_id = current_user.id
    @vote.voteable = @voteable
    if !@vote.save
      flash[:alert] = @vote.errors.full_messages.join(', ')
    end
    redirect_to :back
  end

  def update
    @vote = Vote.find(params[:id])
    if !@vote.update(vote: params[:vote])
      flash[:alert] = @vote.errors.full_messages.join(', ')
    end
    redirect_to :back
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy!
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
    %w(article comment).detect { |type| params["#{type}_id"].present? }
  end
end
