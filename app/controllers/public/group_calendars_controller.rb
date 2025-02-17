class Public::GroupCalendarsController < ApplicationController
    def show
        @calendar = GroupCalendar.find(params[:id])
    end

    def create
        group = Group.find(params[:group_id])
        @calendar = GroupCalendar.new(group_calendar_params)
        @calendar.user_id = current_user.id
        @calendar.group_id = group.id
        @calendar.save
        redirect_to request.referer
    end

    def edit
    end

    def update
    end

    def destroy
        calendar = GroupCalendar.find(params[:id])
        calendar.destroy
        redirect_to group_path()
    end

    private

    def group_calendar_params
        params.require(:group_calendar).permit(:title, :body, :start_time)
    end
end
