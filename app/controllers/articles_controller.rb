class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.create(article_params)
    if @article.save
      flash[:notice] = "Article successfully created!"
      redirect_to articles_path
    else
      flash.now[:alert] = "Article unsuccessfully save, check your work"
      render :new
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :url)
  end
end
