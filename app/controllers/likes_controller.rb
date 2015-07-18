class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user
  before_action :set_likeable

  def create
    if (liked = current_user.likeable_like(@likeable)).present?
      liked.destroy!
    end

    @like = Like.new()
    @like.is_upvote = params[:is_upvote]
    @like.user = @user
    @like.likeable = @likeable
    @like.save

    redirect_to :back
  end

  def update
    @like = Like.find(params[:id])
    @like.update(like_params)
    @like.save

    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy!

    redirect_to :back
  end


  private

  def set_user
    @user = current_user
  end

  def likeable_type
    %w(article comment).detect{ |type| params["#{type}_id"].present? }
  end

  def likeable_id
    params["#{likeable_type}_id"]
  end

  def set_likeable
    @likeable = likeable_type.camelize.constantize.find(likeable_id)
  end
end
