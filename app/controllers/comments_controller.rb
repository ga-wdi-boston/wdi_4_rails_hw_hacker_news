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

    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments: comment_params[:comments], user: current_user)
    flash[:notice] = 'Comment successfully created!'
    redirect_to @article
  end

  private
  def comment_params
    params.require(:comment).permit(:comments)
  end
end
