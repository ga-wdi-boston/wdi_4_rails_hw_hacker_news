class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def new
    @comment = Comment.new
    @article = Article.find(params[:article_id])
  end

  def create

    @article = Article.find(params[:article_id])
    #this code does this:
    #@comment = Comment.new
    #@comment.body = params[:body]
    #@comment.article = @article
    # pushes new comment into article.comments
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article_comments_path(@article)
    else
      render :new
    end

  end
 private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
