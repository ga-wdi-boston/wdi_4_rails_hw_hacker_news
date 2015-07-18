class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @comments = Comment.all
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = (params[:article_id])

    if @comment.save
      redirect_to root_path, notice: 'Thanks for commenting!'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
