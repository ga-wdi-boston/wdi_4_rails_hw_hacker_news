class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new_comments, :show]
  before_action :set_article, except: :new_comments
  before_action :set_comments, only: [:index, :new]
  before_action :set_comment, only: :show

  def index
  end

  def new_comments
    @comments = Comment.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.submitted_at = Time.now.getutc
    @article.comments << @comment
    save_or_render(:new)
  end

  def show
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comments
    @comments = @article.comments.sort_by { |e| -e.points }
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def save_or_render(action)
    if @article.save
      flash[:success] = 'Comment saved'
      redirect_to article_comments_path
    else
      flash.now[:danger] = 'Error: ' + @comment.errors.full_messages.join(', ')
      render action
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
