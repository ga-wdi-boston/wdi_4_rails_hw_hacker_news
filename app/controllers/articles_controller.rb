class ArticlesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create,:edit,:update,:destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find{params[:id]}
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article successfully created"
      redirect_to articles_path
    else
      flash.now[:notice]=@article.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit([:url, :title])
  end

end
