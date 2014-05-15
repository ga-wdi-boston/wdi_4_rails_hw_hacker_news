class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @vote = Vote.new
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        current_user.articles << @article
        flash[:notice] = 'Article has been successfully created!'
        redirect_to root_path
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

