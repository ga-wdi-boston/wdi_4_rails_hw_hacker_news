class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash[:notice] = 'Article has been successfully created!'
    redirect_to root_path
  end

private
  def article_params
    params.require(:article).permit(:title, :url)
  end
end

