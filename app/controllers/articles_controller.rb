class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  #new and create!
  def new
  end

  def create
  end

  #edit and update!
  def edit
  end

  def update
  end

  #delete and destroy!
  def delete
  end

  def destroy
  end

end
