class Admin::GroupsController < ApplicationController
    def index 
        @groups = Group.all 
    end

    def show
        @group = Group.find(params[:id])
        @calendars = @group.group_calendars 
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to admin_groups_path
    end
end
