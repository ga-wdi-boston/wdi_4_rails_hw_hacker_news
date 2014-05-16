class VotesController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_commentable # Gives us @commentable on all actions

  def index
    @comments = @commentable.comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @voteable = find_voteable
    @vote = @voteable.votes.new(score: vote_params[score], user: current_user)
    if @vote.save
      flash[:notice] = 'Thank you for voting!'
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def find_voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def voteable_id
    params[(params[:voteable] + "_id").to_sym]
  end

  def vote_params
    params.require(:vote).permit(:score)
  end

end
