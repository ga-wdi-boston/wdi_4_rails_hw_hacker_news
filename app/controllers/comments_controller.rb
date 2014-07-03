class CommentsController <ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_article
  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to :back, notice: "Just Awesome. Great Comment."
    else
      redirect_to :back, alert: "That did not work yo"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content,)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
