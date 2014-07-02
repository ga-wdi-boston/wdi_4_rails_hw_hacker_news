class CommentsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def new #NOPE
    @comment = Comment.new
    @article = Article.find(params[:article_id])
  end
end
