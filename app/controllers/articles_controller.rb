class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:notice] = "article saved!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    # sorting by vote count breaks pagination (also, very inneficient)
    # What do
    # @articles = Article.all.sort_by(&:vote_count).page params[:page]

      @articles = Article.order(created_at: :desc).page params[:page]
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
  end

  private

  def article_params
    params.require(:article).permit(:url, :title, :submitted_at)
  end

end
