class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create,:edit,:update,:destroy]

  before_action :set_article, :score_count

  def index
    @comments = @article.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "comment successfully created"
      redirect_to article_comments_path
    else
      flash.now[:notice]=@comment.errors.full_messages.join(', ')
      render :new
    end
  end

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

  def score_count
    @article.comments.each do |comment|
        score = comment.votes.where(vote: true).count - comment.votes.where(vote: false).count
        comment.score = score
        comment.save!
    end
  end

end
