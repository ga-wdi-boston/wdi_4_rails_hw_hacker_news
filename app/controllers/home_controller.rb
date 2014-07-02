class HomeController < ApplicationController
  def show
    @articles = Article.order(created_at: :desc)
  end
end
