class FavoritesController < ApplicationController
  
  def create
    @spot = Spot.find(params[:spot_id])
    favorite = Favorite.new(user_id: current_user.id, spot_id: params[:spot_id])
    favorite.save
  end
  
  def destroy
    @spot = Spot.find(params[:spot_id])
    favorite = Favorite.find_by(user_id: current_user.id, spot_id: params[:spot_id])
    favorite.destroy
  end
  
end
