class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @voteable = voteable
    @vote =Vote.new
    @vote.user = current_user
    @vote.voteable = @voteable

    if @vote.save
      redirect_to @voteable, notice: "voted!"
    else
      flash.now[:alert] = @vote.errors.full_messages.join(', ')
      redirect_to @voteable
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy!

    redirect_to :back
  end

  private

  def voteable
    # makes the voteable_type a class and finds it by id
    voteable_type.camelize.constantize.find(voteable_id)
  end

  def voteable_id
    #takes method below and finds it in the params
    params["#{voteable_type}_id"]
  end

  def voteable_type
    # this will return either status or link based on which is there
    %w(status link).detect{ |type| params["#{type}_id"].present?}
  end

end
