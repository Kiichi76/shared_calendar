class Public::UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
    
    def destroy
        @user = User.find(current_user.id)
        @user.destroy
        redirect_to :root
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :handle, :profile_image)
    end
    
end
