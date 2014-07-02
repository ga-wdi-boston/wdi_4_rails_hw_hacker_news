class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :find_article, except: [:index, :new, :create]

  # GET /
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.submitted_at = Time.now.getutc
    save_or_render(:new)
  end

  # GET /articles/:id
  def show
  end

  # GET /articles/:id/edit
  def edit
  end

  # PATCH /articles/:id
  # PUT /articles/:id
  def update
    @article.assign_attributes(article_params)
    save_or_render(:edit)
  end

  # DELETE /articles/:id
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
