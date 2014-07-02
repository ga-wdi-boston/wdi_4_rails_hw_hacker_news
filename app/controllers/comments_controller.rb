class CommentsController < ApplicationController

  before_action :set_article

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = @article

    if @comment.save
      redirect_to @comment.article, notice: "Comment posted!"
    else
      flash.now[:alert] = @comment.errors.full_messages.join(", ")
      redirect_to @article
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit([:content])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end


end
