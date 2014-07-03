class PointsController < ApplicationController
  #   before_action :authenticate_user!

  # def new
  #   @pointable = pointable #(return value of method on line 29)
  #   @point = Point.new
  # end
  # don't need new because there is no form and this is just a place holder

  def create
    @pointable = pointable #(return value of method on line 29
    @point = Point.new(point_params) #creates a new instance of point class
    @point.user = current_user #point has a user_id(foreign key), curren_user has their primary key) i want your associated user to be this user
    @point.pointable = @pointable #@pointable is from the 1st line and holds the association, .pointable is the method which assigns the association to @point (tells point which type it is [status or link])

    if @point.save
      redirect_to @pointable, notice: 'point posted!'
    else
      flash.now[:alert] = @point.errors.full_messages.join(', ')
      render :new
    end

    def destroy
      Point.destroy(params[:id])
      # don't need to assign an instance var bc not posting this in views
    end

    private

    def point_params
      params.require(:point).permit(:content)
    end

    def pointable
      pointable_type.camelize.constantize.find(pointable_id)
    end

    def pointable_id
      params["#{pointable_type}_id"]
    end

    def pointable_type
      %w(status link).detect{ |type| params["#{type}_id"].present? }
    end
  end
end
