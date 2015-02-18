class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all.sort_by(&:score).reverse
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:notice] = "Posted #{@article.title}"
      redirect_to articles_path
    else
      flash.now[:alert] = @article.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end

end
