class ArticlesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.sort_by(&:score).reverse
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path, notice: "Link posted!"
    else
      flash.now[:alert] = @article.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit([:title, :url, :user_id])
  end

end
