class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = "User successfully created, please login."
          redirect_to login_path
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end
end
