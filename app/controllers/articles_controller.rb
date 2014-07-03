class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :find_article, except: [:index, :newest, :new, :create]

  def index
    @articles = Article.all.sort_by { |e| -e.points }
  end

  def newest
    @articles = Article.order(submitted_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.submitted_at = Time.now.getutc
    save_or_render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @article.assign_attributes(article_params)
    save_or_render(:edit)
  end

  def destroy
    @article.destroy!
    flash[:success] = 'Article deleted'
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def save_or_render(action)
    if @article.save
      flash[:success] = 'Article saved'
      redirect_to @bookmark
    else
      flash.now[:danger] = 'Error: ' + @bookmark.errors.full_messages.join(', ')
      render action
    end
  end

  def article_params
    params.require(:article).permit(:title, :url, :submitted_at)
  end
end
