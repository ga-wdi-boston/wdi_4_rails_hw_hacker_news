class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def show
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to root_path, notice: 'Comment posted!'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
