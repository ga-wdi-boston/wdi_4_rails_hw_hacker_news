class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_article

  def index
    @comments = @article.comments
  end

  def new
    @comment = @article.comments.new
  end

  def create
    @comment = @article.comments.new(comments_params)
    if @comment.save
      flash[:notice] = "Posted #{@comment.title}"
      redirect_to @comments
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
