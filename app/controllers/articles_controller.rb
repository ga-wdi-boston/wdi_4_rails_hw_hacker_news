class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  def index
    @articles = Article.all
  end

  def show
  end
  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    flash[:notice] = "Article successfully created!"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end
end
