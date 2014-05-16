class VotesController < ApplicationController

  def create
    value = params[:direction] ? 1 ; -1
    redirect_to :back, notice: "Thank you for voting!"
  end


end
