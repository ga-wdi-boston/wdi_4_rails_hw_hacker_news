class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def create
    #Get votable(status or link) from user.
    @vote = Vote.new(vote: params[:vote])
    @vote.user = current_user
    @vote.votable = votable


    @vote.save!
    redirect_to :back
  end


  def destroy
    Vote.find(params[:id]).destroy!
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
