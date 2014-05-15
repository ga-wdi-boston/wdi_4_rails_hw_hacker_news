class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.new(body: comment_params[:body], user: current_user)
    if @comment.save
      flash[:notice] = 'Comment received'
      redirect_to root_path
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render [:new, article, @comment]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
