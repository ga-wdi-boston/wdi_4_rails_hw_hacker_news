class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:filter].present?
      if params[:filter] == 'UserArticles'
        @articles = current_user.articles
      end
    else
      @articles = Article.all
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params)
    current_user.articles << @article
    flash[:notice] = 'New Article Created Successfully'
    redirect_to root_path
  end

  def update
    @article = Article.update(article_params)
    flash[:notice] = 'Article Updated Successfully'
    redirect_to article(@article)
  end

  def destroy
    @article.destroy
  end

  private
  def set_article
    if user_signed_in?
      @article = current_user.articles.find(article_params)
    else
      @article = Article.find(article_params)
    end
  end

  def find_voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def article_params
    params.require(:article).permit(:url, :title)
  end
end

