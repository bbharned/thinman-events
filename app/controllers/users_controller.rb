class UsersController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "Welcome to ThinManager Events, #{@user.firstname}"
        redirect_to events_path
    else
       render 'new'
    end
end


private

def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :company, :relation, :password)
end

end