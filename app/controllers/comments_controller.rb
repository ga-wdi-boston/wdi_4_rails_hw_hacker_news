class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create,:edit,:update,:destroy]

  before_action :set_article

  def index
    @comments = @article.comments
  end

  # def show
  #   @comment = @article.comments.find(params[:id])
  # end

  # def new
  #   @comment = Comment.new
  # end

  # def create
  #   @comment = @article.comments.new(comment_params)
  #   @comment.user_id = current_user.id
  #   if @comment.save
  #     flash[:notice] = "comment successfully created"
  #     redirect_to comments_path
  #   else
  #     flash.now[:notice]=@comment.errors.full_messages.join(', ')
  #     render :new
  #   end
  # end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy

  #   #Show all products
  #   redirect_to @comment, notice: "You have deleted the comment"
  # end

  private

  def comment_params
    params.require(:comment).permit([:body])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

end
