class CommentsController <ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_article
  def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@article), notice: "Just Awesome. Great Comment."
    else
      redirect_to article_path(@article), alert: "That did not work yo"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
