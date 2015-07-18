class ArticlesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all
    @article = Article.find_by(params[:id])

  end

#don't need the show page

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Article updated!"
    else
      render :edit
    end
  end

private

  def article_params
    params.require(:article).permit([:title, :url])
  end
end
