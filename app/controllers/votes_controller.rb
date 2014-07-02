class VotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @vote = Vote.new
  end

  def create
    @voteable = voteable
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.voteable = @voteable
    save_or_render(:new)
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @voteable = votable
    @vote = Vote.find(params[:id])
    @vote.assign_attributes(vote_params)
    save_or_render(:edit)
  end

  private

  def save_or_render(action)
    if @vote.save
      redirect_to @votable, notice: 'Vote saved'
    else
      flash[:alert] = @vote.errors.full_message.join(', ')
      render action
    end
  end

  def vote_params
    params.require(:vote).permit(:vote)
  end

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
