class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    upvote = Upvote.new
    upvote.user = current_user
    upvote.upvoteable = upvoteable

    upvote.save!
    redirect_to :back
  end

  def destroy
    Upvote.find(params[:id]).destroy!
    redirect_to :back
  end

  private

  def upvoteable
    upvoteable_type.camelize.constantize.find(upvoteable_id)
  end

  def upvoteable_id
    params["#{upvoteable_type}_id"]
  end

  def upvoteable_type
    article.detect{ |type| params["#{type}_id"].present? }
  end
end
