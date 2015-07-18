class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to root_path, notice: 'You successfully created an article.'
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end
end
