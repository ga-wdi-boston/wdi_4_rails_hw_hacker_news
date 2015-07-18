class ArticlesController < ApplicationController

before_action :authenticate_user!, only: [:new]

def index
  @articles = Article.all
end

def show
  @article = Article.find(params[:id])
end

def new
  @article = Article.new
end

# Allows user to create a new article
def create
  # Instantiate a new instance from the form fields, which live in the params hash
  @article = Article.new(article_params)
  if @article.save
    redirect_to articles_path
  else
    render :new
  end
end

  private

  # Private params hash; indicates parameters that can be edited by user
  def article_params
    params.require(:article).permit([:title, :url, :submitted_at])
  end

end
