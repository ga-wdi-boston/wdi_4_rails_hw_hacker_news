class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_article

  def index
    @comments = @article.comments.sort_by(&:score).reverse
  end

  def new
    @comment = @article.comments.new
  end

  def create
    @comment = @article.comments.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Posted comment."
      redirect_to article_comments_path(@article, @song)
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
