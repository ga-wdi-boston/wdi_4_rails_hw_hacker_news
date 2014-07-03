class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
     @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def score
    @article = article(:id).upvote.count - article(:id).downvote.count
  end

end
