class DownVotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @down_voteable = down_voteable
    @down_vote = DownVote.new
    @down_vote.user = current_user
    @down_vote.down_voteable = @down_voteable

    if @down_vote.save
      redirect_to :back, notice: "down_voted!"
    else
      flash.now[:alert] = @down_vote.errors.full_messages.join(', ')
      redirect_to @down_voteable
    end
  end

  def destroy
    @down_vote = DownVote.find(params[:id])
    @down_vote.destroy!

    redirect_to :back
  end

  private

  def down_voteable
    # makes the voteable_type a class and finds it by id
    down_voteable_type.camelize.constantize.find(down_voteable_id)
  end

  def down_voteable_id
    #takes method below and finds it in the params
    params["#{down_voteable_type}_id"]
  end

  def down_voteable_type
    # this will return either status or link based on which is there
    %w(article comment).detect{ |type| params["#{type}_id"].present?}
  end

end
