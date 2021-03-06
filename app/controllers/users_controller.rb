class UsersController < ApplicationController
#attr_accessor :remember_token, :activation_token, :reset_token
before_action :set_user, only: [:edit, :update, :show]
before_action :require_user, except: [:new, :create]
before_action :require_same_user, only: [:edit, :update, :destroy]
before_action :require_admin, only: [:destroy]

def index
    @users = User.paginate(page: params[:page], per_page: 10)
end

def new
    @user = User.new
end


def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to ThinManager Events, #{@user.firstname}"
        redirect_to user_path(@user)
    else
       render 'new'
    end
end


def edit    
end


def update
    if @user.update(user_params)
        flash[:success] = "Your account has been updated"
        redirect_to events_path
    else
        render 'edit'
    end
end

def show
    #@user = User.find(params[:id])
    @events = Event.all
    @registered_events = UserRegister.all.any?{ |session| session.user_id == @user.id and session.event_id == @events.ids }
end

def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all Events created by user have been deleted."
    redirect_to users_path
end






private

def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :company, :relation, :password, event_ids: [])
end

def set_user
    @user = User.find(params[:id])
end


def require_same_user
    if current_user != @user && !current_user.admin?
        flash[:danger] = "You can only edit your own account."
        redirect_to user_path(current_user)
    end
end

def require_admin
    if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
    end
end

end