class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_article

  def index
    @comments = @article.comments
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
