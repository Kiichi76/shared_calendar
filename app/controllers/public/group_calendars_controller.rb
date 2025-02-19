class Public::GroupCalendarsController < ApplicationController
    def show
        @calendar = GroupCalendar.find(params[:id])
        @comment = Comment.new
    end

    def create
        @calendar = GroupCalendar.new(group_calendar_params)
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
        redirect_to groups_path
    end

    private

    def group_calendar_params
        params.require(:group_calendar).permit(:title, :body, :start_time, :group_id, :user_id)
    end
end
