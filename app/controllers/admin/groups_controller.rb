class Admin::GroupsController < ApplicationController
    def index 
        @groups = Group.all 
    end

    def show
        @group = Group.find(params[:id])
        @calendars = @group.group_calendars 
    end
end
