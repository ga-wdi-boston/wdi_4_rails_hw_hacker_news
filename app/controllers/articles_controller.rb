class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_user, only: [:create, :update, :destroy, :edit, :new]

  def index
    @articles = Article.all
    @articles = Like.order_by_score(@articles)
    @like = Like.new
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments =  Comment.all
    @comments = Like.order_by_score(@comments)
  end

  def create

    @article = Article.new(article_params)

    save_article_or_render(:new)
  end

  def new
    @article = Article.new
    @user = current_user
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])
    @article.update(article_params)

    save_article_or_render(:edit)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!
    redirect_to(articles_path)
  end

  private

  def save_article_or_render(action)

    @user.articles << @article
    if @user.save
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

  def set_user
    @user = current_user
  end

end
