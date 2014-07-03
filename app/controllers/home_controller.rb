class HomeController < ApplicationController
  def show
    @all_articles = Article.all
    @all_articles.each do |article|
      article.vote_count
      article.save!
    end

    @articles = Article.all.sort_by(&:vote_score).reverse

    if (params.has_key?(:article_id))
      @selected_article_comments = Article.find(params[:article_id]).comments.sort_by(&:vote_score).reverse
      @selected_article = Article.find(params[:article_id])
    else
      @selected_article_comments = Article.all.sort_by(&:vote_score).reverse.first.comments
      @selected_article = Article.all.sort_by(&:vote_score).reverse.first
    end

  end
end
