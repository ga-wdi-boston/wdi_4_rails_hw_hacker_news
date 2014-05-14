class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.new(comment_params)
    if comment.save
      flash[:notice] = 'Comment received'
      redirect_to root_path
    else
      flash.now[:alert] = comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end



end
