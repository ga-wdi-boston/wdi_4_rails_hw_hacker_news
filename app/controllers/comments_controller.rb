class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(message: comment_params[:message], user: current_user)

    if @comment.save
      flash[:notice] = 'Comment successfully created!'
      redirect_to @article
    else
      flash[:notice] = @comment.errors.full_messages.join(', ')
      redirect_to @article
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
