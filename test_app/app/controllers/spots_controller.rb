class SpotsController < ApplicationController
  
  def new
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @spot.save ? (redirect_to spots_path) : (render :new)
  end
  
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @spot_comment = SpotComment.new
  end
  
  def destroy
    @spot = Spot.find(params[:id])
    @spot.delete
    redirect_to spots_path
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:spot_name,:image,:caption)
  end
  
end
