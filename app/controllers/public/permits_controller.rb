class Public::PermitsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @group = Group.find(params[:group_id])
        @permit = Permit.new
        @permit.user_id = current_user.id
        @permit.group_id = @group.id
        @permit.save
        redirect_to request.referer
    end

    def destroy
        permit = Permit.find_by(group_id: params[:group_id], user_id: current_user.id)
        permit.destroy
        redirect_to request.referer
    end
end
