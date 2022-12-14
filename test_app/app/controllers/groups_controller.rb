class GroupsController < ApplicationController
  
  def index
   @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    @group_users = GroupUser.where(group_id: @group.id)
  end

  def edit
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
  
  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end
  
  def destroy
  end
  
  
  private
  
  def group_params
    params.require(:group).permit(:group_name, :introduction, :group_image)
  end
  
end
