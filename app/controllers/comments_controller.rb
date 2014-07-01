class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = params[:article_id]
    if @comment.save
      redirect_to Article.find(@comment.article_id), notice: "Comment Posted!"
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
