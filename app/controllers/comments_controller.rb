class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, except: [:index, :new, :create]

  # GET /articles/:article_id/comments
  def index
    @comments = @article.comments
  end

  # GET /articles/:article_id/comments/new
  def new
    @comment = Comment.new
  end

  # POST /articles/:article_id/comments
  def create
    @comment = Comment.new(comment_params)
    @comment.submitted_at = Time.now.getutc
    save_or_render
  end

  # GET /articles/:article_id/comments/:id
  def show
  end

  # GET /articles/:article_id/comments/:id/edit
  def edit
  end

  # PATCH /articles/:article_id/comments
  def update
    @comment.assign_attributes(comment_params)
    save_or_render
  end

  # DELETE /articles/:article_id/comments/:id
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
