class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def create
    #Get votable(status or link) from user.
    @vote = Vote.new
    @vote.user = current_user
    @vote.votable = votable
    @vote.vote = true

    @vote.save!
    redirect_to :back
  end


  def destroy
    vote.find(params[:id]).destroy!
    redirect_to :back
  end



  private

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
