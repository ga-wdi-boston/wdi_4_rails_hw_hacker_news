class VotesController < ApplicationController

  def create
    @voted_upon = voteable

    @vote = Vote.new
    @vote.user = current_user

    @vote.voteable = @voted_upon

    @vote.value = value

    @vote.save!
    redirect_to @voted_upon, notice: "Vote recorded! You voted #{@vote.value}!"
  end

  def update

  end

  private

  def value
    params[:value]
  end

  def voteable_type
    %w(comment, article).detect{ |type| params["#{type}_id"].present? }
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
