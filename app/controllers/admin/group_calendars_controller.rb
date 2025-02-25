class Admin::GroupCalendarsController < ApplicationController
  def show
    @calendar = GroupCalendar.find(params[:id])
  end

  def destroy
    calendar = GroupCalendar.find(params[:id])
    calendar.destroy
    redirect_to admin_groups_path
  end
end
