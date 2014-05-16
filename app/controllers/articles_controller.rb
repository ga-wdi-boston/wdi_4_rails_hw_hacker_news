class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @vote = Vote.new
  end

  def show
    @vote = Vote.new
  end

  def new
    @article = Article.new
  end

  def create

    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Article successfully created!"
      redirect_to articles_path
    else
      flash.now[:alert] = "Article unsuccessfully saved: " + @article.errors.full_messages.join('. ')
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
