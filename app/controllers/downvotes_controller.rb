class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    downvote = Downvote.new
    downvote.user = current_user
    downvote.downvoteable = downvoteable

    downvote.save!
    redirect_to :back
  end

  def destroy
    Downvote.find(params[:id]).destroy!
    redirect_to :back
  end

  private

  def downvoteable
    downvoteable_type.camelize.constantize.find(downvoteable_id)
  end

  def downvoteable_id
    params["#{downvoteable_type}_id"]
  end

  def downvoteable_type
    article.detect{ |type| params["#{type}_id"].present? }
  end
end
