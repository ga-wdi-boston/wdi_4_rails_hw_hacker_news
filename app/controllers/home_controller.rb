class HomeController < ApplicationController
  def show
    @all_articles = Article.all
    @all_articles.each do |article|
      article.vote_count
      article.save!
    end

    @articles = Article.all.sort_by(&:vote_score).reverse

    if (params.has_key?(:article_id))
      @selected_article_comments = Article.find(params[:article_id]).comments
    else
      @selected_article_comments = Article.first.comments
    end

  end
end
