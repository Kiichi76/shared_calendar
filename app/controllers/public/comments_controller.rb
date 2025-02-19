class Public::CommentsController < ApplicationController
    def create
        calendar = GroupCalendar.find(params[:group_calendar_id])
        comment = Comment.new(comment_params)
        comment.group_calendar_id = calendar.id
        comment.user_id = current_user.id
        comment.save 
        redirect_to request.referer
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to group_calendar_path(params[:group_calendar_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:comment)
    end
end
