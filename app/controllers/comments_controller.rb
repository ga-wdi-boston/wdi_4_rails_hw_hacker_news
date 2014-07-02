class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article
  before_action :set_comment, except: [:index, :new, :create]

  def index
    @comments = @article.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.submitted_at = Time.now.getutc
    save_or_render
  end

  def show
  end

  def edit
  end

  def update
    @comment.assign_attributes(comment_params)
    save_or_render
  end

  def destroy
    @comment.destroy!
    flash[:success] = 'Comment deleted'
    redirect_to comments_path
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def save_or_render(action)
    if @comment.save
      flash[:success] = 'Comment saved'
      redirect_to @comment
    else
      flash.now[:danger] = 'Error: ' + @comment.errors.full_messages.join(', ')
      render action
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
