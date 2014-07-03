class VotesController < ApplicationController

  def create
    @voteable = voteable
    @vote = @voteable.votes.new
    @vote.user = current_user

    if @vote.save
      if @voteable.class == 'Article'
        redirect_to articles_path
      else @voteable.class == 'Comment'
        redirect_to article_comments_path(@comment.article_id)
      end
    else
      flash[:notice] = 'Your vote was not saved'
      redirect_to articles_path
    end
  #in views call articles.votes.count, .size
  end

  private

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
