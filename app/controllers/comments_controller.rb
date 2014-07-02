class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_article, only: [:create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = @article

    if @comment.save
      flash[:notice] =  "Your comment was successfully submitted."
    else
      flash[:notice] = "Your comment failed."
    end
    redirect_to @article
  end

  def destroy
    @comment = Comment.find(params[:id])

    flash[:notice] = @comment.destroy ? "Your comment was successfully deleted." : "The comment failed deletion."
    redirect_to :back

  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
end
