class Public::PersonalCalendarsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        user = User.find(current_user.id)
        @calendars = user.personal_calendars
        @calendar = PersonalCalendar.new
    end
    
    def create 
        user = User.find(current_user.id)
        @calendar = PersonalCalendar.new(calendar_params)
        @calendar.user_id = user.id
        if @calendar.save
            redirect_to request.referer
        else
            render :index
        end
    end
    
    def show
        @calendar = PersonalCalendar.find(params[:id])
    end
    
    def edit 
        @calendar = PersonalCalendar.find(params[:id])
    end

    def update
        @calendar = PersonalCalendar.find(params[:id])
        if @calendar.update(calendar_params)
            redirect_to personal_calendar_path(@calendar)
        else
            render :edit
        end
    end

    def destroy
        @calendar = PersonalCalendar.find(params[:id])
        @calendar.destroy
        redirect_to personal_calendars_path
    end
    
    private
    
    def calendar_params
        params.require(:personal_calendar).permit(:user_id, :title, :body, :start_time)
    end
    
end
