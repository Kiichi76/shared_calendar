class Public::GroupUsersController < ApplicationController
    def create 
        @group = Group.find(params[:group_id])
        @permit = Permit.find(params[:permit_id])
        @group_user = GroupUser.create(user_id: @permit.user_id, group_id: params[:group_id])
        @permit.destroy
        redirect_to request.referer
    end
    
    def destroy
        @group_user = GroupUser.find_by(group_id: params[:group_id], user_id: current_user.id)
        @group_user.destroy
        redirect_to request.referer
    end

end
