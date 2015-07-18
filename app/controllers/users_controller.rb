class UsersController < ApplicationController

  def article_manager
    @user = current_user
    @articles = @user.articles
  end
end
