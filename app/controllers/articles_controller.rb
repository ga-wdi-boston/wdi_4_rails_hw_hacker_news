class ArticlesController < ApplicationController

  before_action :authenticate_user!

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
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
