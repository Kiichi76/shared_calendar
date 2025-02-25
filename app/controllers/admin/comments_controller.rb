class Admin::CommentsController < ApplicationController
    before_action :authenticate_admin!
    def destroy
        Comment.find(params[:id]).destroy
        redirect_to admin_group_calendar_path(params[:group_calendar_id])
    end
end
