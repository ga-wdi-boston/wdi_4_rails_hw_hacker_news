class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_voteable

  def index
    @votes = @voteable.votes
  end


  def show
  end


  def new
    @vote = Vote.new
  end

  def edit
  end


  def create
    @vote = @voteable.votes.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to [@voteable, @vote], notice: 'Vote was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to [@voteable, @vote], notice: 'Vote was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to [@voteable, :votes] }
    end
  end



  private

    def set_vote
      @vote = Vote.find(params[:id])
    end

    def set_voteable
      @voteable = params[:voteable].classify.constantize.find(voteable_id)
    end

    def voteable_id
      params[(params[:voteable] + "_id").to_sym]
    end

    def vote_params
      params.require(:vote).permit(:rating)
    end

end
