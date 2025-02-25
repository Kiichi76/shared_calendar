class Admin::GroupCalendarsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @calendar = GroupCalendar.find(params[:id])
  end

  def destroy
    calendar = GroupCalendar.find(params[:id])
    calendar.destroy
    redirect_to admin_groups_path
  end
end
