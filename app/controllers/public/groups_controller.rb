class Public::GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def index
    user = User.find(current_user.id)
    @groups = user.groups
  end

  def show
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:name, :group_image)
  end
end
