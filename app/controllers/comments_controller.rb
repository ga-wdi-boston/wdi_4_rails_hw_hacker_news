class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @vote = Vote.new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create

    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comments: comment_params[:comments], user: current_user)
    if @comment.save
      flash[:notice] = 'Comment successfully created!'
      redirect_to @article
    else
      flash.now[:alert] = "Comment unsuccessfully saved: " + @comment.errors.full_messages.join('. ')
      @vote = Vote.new
      render :new
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:comments)
  end
end
