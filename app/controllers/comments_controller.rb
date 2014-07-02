class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @commentable = commentable #(return value of method on line 29)
    @comment = Comment.new
  end

  def create
    @commentable = commentable #(return value of method on line 29
    @comment = Comment.new(comment_params) #creates a new instance of Comment class
    @comment.user = current_user #comment has a user_id(foreign key), curren_user has their primary key) i want your associated user to be this user
    @comment.commentable = @commentable #@commentable is from the 1st line and holds the association, .commentable is the method which assigns the association to @comment (tells comment which type it is [status or link])

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
    %w(status link).detect{ |type| params["#{type}_id"].present? }
  end
end
