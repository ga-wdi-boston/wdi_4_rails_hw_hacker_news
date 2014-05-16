class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new()
  end

  def edit
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    current_user.comments << @comment
    redirect_to root_path
  end

  def update
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    if user_signed_in?
      @comment = current_user.comments.find(comment_params)
    else
      @comment = Comment.find(comment_params)
    end
  end


  def find_voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
