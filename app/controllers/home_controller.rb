class HomeController < ApplicationController
  def show
    @articles = Article.order(created_at: :desc)

    if (params.has_key?(:article_id))
      @recent_article_comments = Article.find(params[:id]).comments
    else
      @recent_article_comments = Article.first.comments
    end

  end
end
