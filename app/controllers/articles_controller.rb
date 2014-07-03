class ArticlesController < ApplicationController
#   before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all
  end

#   def show
#     @article = Article.find(params[:id])
#     @comment = Comment.new
#   end

#   def new
#     @article = Article.new
#   end

#   def create
#     @article = current_user.articles.new(article_params)

#     if @article.save
#       redirect_to @article, notice: 'article was successfully created.'
#     else
#       flash.now[:alert] = @article.errors.full_messages.join(', ')
#       render :new
#     end
#   end

#   private

#   def article_params
#     params.require(:article).permit(:url, :title)
#   end
end
