class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.create(comment_params)
    flash[:notice] = "Comment Successfully Posted"
    redirect_to article_comment_path(article, comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:comments)
  end
end
