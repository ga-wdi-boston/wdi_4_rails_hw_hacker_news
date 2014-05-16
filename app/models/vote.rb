class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true


def index
  @vote = Haiku.find_with_reputation(:votes, :all, order: "votes desc")
end

def vote
  value = params[:type] == "up" ? 1 : -1
  @haiku = Haiku.find(params[:id])
  @haiku.add_or_update_evaluation(:votes, value, current_user)
  redirect_to :back, notice: "Thank you for voting"
end







end
