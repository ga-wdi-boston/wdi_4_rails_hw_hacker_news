class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.order(created_at: :desc).all
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:notice] = 'Article successfully created'
      redirect_to root_path
    else
      flash.now[:error] = @article.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end

end
