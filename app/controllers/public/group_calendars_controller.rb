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
        @calendar = GroupCalendar.find(params[:id])
    end

    def update
        @calendar = GroupCalendar.find(params[:id])
        if @calendar.update(group_calendar_params)
            redirect_to group_group_calendar_path(@calendar)
        else
            render :edit
        end
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
