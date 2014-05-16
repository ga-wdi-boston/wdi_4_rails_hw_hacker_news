class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = 'Comment successfully created'
      redirect_to article_path(@article)
    else
      flash.now[:error] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
