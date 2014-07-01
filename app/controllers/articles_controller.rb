class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    save_article_or_render(:new)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.new
  end

  def update
    @article = Article.find(params[:id])

    save_article_or_render(:edit)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!
    redirect_to(articles_path)
  end

  private

  def save_artice_or_render(action)
    if @article.save
      flash[:success] = "Article saved."
      redirect_to @article
    else
      flash[:alert] = 'Error: ' + @article.errors.full_messages.join(', ')
      render(action)
    end
  end

  def article_params
    params.require(:article).permit(:url, :title)
  end

end
