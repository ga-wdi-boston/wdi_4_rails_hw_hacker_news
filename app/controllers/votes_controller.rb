class VotesController < ApplicationController

  before_action :authenticate_user!

  def create
    @voted_upon = voteable

    @vote = Vote.new
    @vote.user = current_user
    @vote.voteable = @voted_upon
    @vote.value = value
    @existing = current_user.votes_for(@voted_upon) # this is an array!

    if @existing.present?
      if !@existing.map(&:value).include? @vote.value
        @vote.save!
      end
      @existing.each do | oldvote |
        oldvote.destroy if oldvote.value = @vote.value
      end
      redirect_to source, notice: "Vote changed"
    else
      @vote.save!
      redirect_to source, notice: "Vote recorded! You voted #{@vote.value}!"
    end
  end


  private

  def value
    params[:value]
  end

  def source
    if voteable_type == "article"
      @voted_upon
    else
      @voted_upon.article
    end
  end

  def voteable_type
    %w(comment article).detect{ |type| params["#{type}_id"].present? }
  end

  def voteable_id
    params["#{voteable_type}_id"]
  end

  def voteable
    if voteable_type.present?
      voteable_type.camelize.constantize.find(voteable_id)
    else
       raise "OMG SOMETHING IS WRONG"
    end
  end

end
