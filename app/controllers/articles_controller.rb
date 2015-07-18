class ArticlesController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :delete, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  #new and create!
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
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
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: "Sick changes man"
    else
      render :edit
    end
  end

  # and destroy!
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path

  end

  private
  def article_params
    params.require(:article).permit(:title,:url,:user_id,:created_at)
  end

end
