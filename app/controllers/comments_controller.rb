class CommentsController < ApplicationController

  def index
    if current_user
      @comments = current_user.comments(created_at: :desc)
    else
      @comments = Comment.all.order(created_at: :desc)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment successfully added!'
      redirect_to comments_path
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :submission_date)
  end

end
