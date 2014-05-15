class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index

    # Passes the article_id into the Article.find
    # and stores that particular article in the @article instance variable

    @article = Article.find(params[:article_id])

    # sorts the comments of the given article by created_at
    # descending and assigns it to the @comments instance variable
    @comments = @article.comments.order(created_at: :desc)

    # Combines the "new" action into the index, allowing
    # the User to create comments on the same page they view them on
    # (same way the real Hacker News does it!)
    @comment = Comment.new
  end

  def create
    article = Article.find(params[:article_id])
    comment = article.comments.create(comment_params)
    current_user.comments << comment
    redirect_to article_comments_path(article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end

