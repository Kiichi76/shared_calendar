class Public::GroupCalendarsController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @calendar = GroupCalendar.find(params[:id])
        @comment = Comment.new
    end

    def create
        @calendar = GroupCalendar.new(group_calendar_params)
        tags = []
        if group_calendar_params[:image].present?
            #byebug
            tags = Vision.get_image_data(group_calendar_params[:image])
        end
        if @calendar.save
            tags.each do |tag|
                @calendar.tags.find_or_create_by(name: tag)
            end
            redirect_to request.referer
        else
            redirect_to request.referer
        end
    end

    def edit
        @calendar = GroupCalendar.find(params[:id])
    end

    def update
        @calendar = GroupCalendar.find(params[:id])
        if @calendar.update(group_calendar_params)
            redirect_to group_calendar_path(@calendar)
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
        params.require(:group_calendar).permit(:title, :body, :start_time, :group_id, :user_id, :image)
    end
end
