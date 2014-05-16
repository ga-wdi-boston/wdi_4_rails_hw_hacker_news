class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true


  def index
  end

  def create
    value = params[:type] == "up" ? 1 : -1
  end


end
