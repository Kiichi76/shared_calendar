class Public::FavoritesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        calendar = GroupCalendar.find(params[:group_calendar_id])
        favorite = current_user.favorites.new(group_calendar_id: calendar.id)
        favorite.save
        redirect_to request.referer
    end

    def destroy
        calendar = GroupCalendar.find(params[:group_calendar_id])
        favorite = current_user.favorites.find_by(group_calendar_id: calendar.id)
        favorite.destroy
        redirect_to request.referer
    end
end
