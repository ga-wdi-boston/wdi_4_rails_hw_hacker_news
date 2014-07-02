class ArticlesController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :delete, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  #new and create!
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    @article.submitted_on = DateTime.now
    if @article.save
      flash[:notice] = 'Article created!'
      redirect_to articles_path
    else
      flash.now[:alert]=@article.errors.full_messages.join(', ')
      render :new
    end
  end

  #edit and update!
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: "Sick changes man"
    else
      render :edit
    end
  end

  #delete and destroy!
  def delete
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title,:url)
  end

end
