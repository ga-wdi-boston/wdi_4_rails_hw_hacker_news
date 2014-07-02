class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]

  def destroy
    @voteable = voteable
    @vote = current_user.vote_for(@voteable)
    @vote.destroy!
    flash[:success] = 'Un-voted!'
    redirect_to :back
  end

  def create
    @voteable = voteable
    @vote = Vote.new
    @vote.user = current_user
    @vote.voteable = @voteable

    if @vote.save
      redirect_to :back, notice: "Voted!"
    else
      flash.now[:alert] = @vote.errors.full_messages.join(', ')
      redirect_to :back
    end
  end

  private

  def vote_params
    require(:votes).permit(:upvote)
  end

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
