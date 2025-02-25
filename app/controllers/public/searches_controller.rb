class Public::SearchesController < ApplicationController
    before_action :authenticate_user!
    
    def search_user
        @users = User.looks(params[:range], params[:word])
    end

    def search_group
        @groups = Group.looks(params[:range], params[:word])
    end
end
