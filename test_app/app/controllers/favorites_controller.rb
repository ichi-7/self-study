class FavoritesController < ApplicationController
  
  def create
    favorite = Favorite.new(user_id: current_user.id, spot_id: params[:spot_id])
    favorite.save
    redirect_to spot_path(params[:spot_id])
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, spot_id: params[:spot_id])
    favorite.destroy
    redirect_to spot_path(params[:spot_id])
  end
  
end
