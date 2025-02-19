class Public::FavoritesController < ApplicationController
    def create
        calendar = GroupCalendar.find(params[:group_calendar_id])
        favorite = Favorite.new
        favorite.user_id = current_user.id
        favorite.group_calendar_id = calendar.id
        favorite.save
        redirect_to group_calendar_path(calendar)
    end

    def destroy
        calendar = GroupCalendar.find(params[:group_calendar_id])
        favorite = Favorite.find_by(group_calendar_id: calendar.id)
        favorite.destroy
        redirect_to group_calendar_path(calendar)
    end
end
