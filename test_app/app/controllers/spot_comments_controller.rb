class SpotCommentsController < ApplicationController
  
  def create
    spot = Spot.find(params[:spot_id])
    comment = SpotComment.new(spot_comment_params)
    comment.user_id = current_user.id
    comment.spot_id = spot.id
    comment.save
    redirect_to spot_path(spot)
  end
  
  def destroy
    SpotComment.find(params[:id]).destroy
    redirect_to spot_path(params[:spot_id])
  end
  
  private
  
  def spot_comment_params
    params.require(:spot_comment).permit(:comment)
  end
  
end
