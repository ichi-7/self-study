class SpotCommentsController < ApplicationController
  
  def create
    @spot = Spot.find(params[:spot_id])
    spot = Spot.find(params[:spot_id])
    comment = SpotComment.new(spot_comment_params)
    comment.user_id = current_user.id
    comment.spot_id = spot.id
    comment.save
  end
  
  def destroy
    @spot = Spot.find(params[:spot_id])
    SpotComment.find(params[:id]).destroy
  end
  
  private
  
  def spot_comment_params
    params.require(:spot_comment).permit(:comment)
  end
  
end
