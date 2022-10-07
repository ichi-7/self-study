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
  end

  def edit
  end
  
  def destroy
  end
  
  
  private
  
  def group_params
    params.require(:group).permit(:group_name, :introduction, :group_image)
  end
  
end
