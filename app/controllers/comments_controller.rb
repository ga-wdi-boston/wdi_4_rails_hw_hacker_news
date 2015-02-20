class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @commentable = commentable
    @comment = Comment.new
  end

  def create
    @commentable = commentable
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.commentable = @commentable

    if @comment.save
      redirect_to @commentable, notice: 'Comment posted!'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def commentable
    commentable_type.camelize.constantize.find(commentable_id)
  end

  def commentable_id
    params["#{commentable_type}_id"]
  end

  def commentable_type
    # Will return string: status or string: link depending on route
    # Becomes RETURN_id (link_id, or status_id)
    %w(article).detect{ |type| params["#{type}_id"].present? }
  end
end

# This is always hard to do
