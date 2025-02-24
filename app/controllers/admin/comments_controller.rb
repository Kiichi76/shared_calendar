class Admin::CommentsController < ApplicationController
    def destroy
        Comment.find(params[:id]).destroy
        redirect_to group_calendar_path(params[:group_calendar_id])
    end
end
