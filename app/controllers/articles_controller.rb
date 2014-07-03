class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
     @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def score
    @article = Article(:id).upvote.count - Article(:id).downvote.count
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: "Article #{@article.title} created "
    else
      render :new
    end
  end
 private

  def article_params
    params.require(:article).permit([:title, :body])
  end

end
