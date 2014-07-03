class ArticlesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create,:edit,:update,:destroy]
  before_action :score_count

  def index
    @articles = Article.all.order(score: :desc).order(:title)
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
      flash[:notice] = "Article successfully created"
      redirect_to articles_path
    else
      flash.now[:notice]=@article.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy


    redirect_to @article, notice: "You have deleted the article"
  end

  private

  def article_params
    params.require(:article).permit([:url, :title])
  end

  def score_count
    Article.all.each do |article|
        score = article.votes.where(vote: true).count - article.votes.where(vote: false).count
        article.score = score
        article.save!
    end
  end

end
