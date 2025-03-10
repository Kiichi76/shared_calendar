class Public::GroupsController < ApplicationController
  before_action :authenticate_user!

  def permits
    @group = Group.find(params[:id])
    @permits = @group.permits
  end
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def index
    @user = User.find(current_user.id)
    join_group_ids = @user.groups.ids
    owner_group_ids = Group.where(owner_id: @user.id).ids
    @groups = Group.where(id: join_group_ids + owner_group_ids)
  end

  def permits 
    @group = Group.find(params[:id])
    @permits = @group.permits
  end

  def show
    @group = Group.find(params[:id])
    @calendars = @group.group_calendars 
    @calendar = GroupCalendar.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end


  private

  def group_params
    params.require(:group).permit(:name, :owner_id,:group_image)
  end

end
