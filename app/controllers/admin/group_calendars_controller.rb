class Admin::GroupCalendarsController < ApplicationController
  def show
    @calendar = GroupCalendar.find(params[:id])
  end
end
