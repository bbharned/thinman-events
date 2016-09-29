class UserRegistersController < ApplicationController
    before_action :require_user
    before_action :require_admin, only: [:checkin]

    def new
        @register = UserRegister.new
    end

    def create  
      @registers = UserRegister.all
      @event = Event.find(params[:event_id])
      @register = UserRegister.new(user_id: current_user.id, event_id: params[:event_id])
      @all_registered = @registers.where(event_id: @event.id)

      if @registers.any?{ |session| session.user_id == current_user.id and session.event_id == @event.id }

        flash[:danger] = "You Are Already Registered for This Event"
        redirect_to root_path

      elsif @event.capacity && @all_registered.count >= @event.capacity

        flash[:danger] = "Sorry, registration for this event is full"
        redirect_to events_path   

      else
          if @event.cost > 0 && @event.cost != nil
            flash[:danger] = "This event cost money, I'm working on that"
            redirect_to events_path
          else
            if @register.save 
                  flash[:success] = "The selected event has been added to your schedule"
                  redirect_to user_path(current_user)
            else
                  flash[:danger] = "There was a problem adding this session"
                  redirect_to user_path(current_user)
            end
        end
      end
    end


    def checkin
      @events = Event.all
    end

    def attended
      @attendee = UserRegister.find(params[:id])
      @attendee.checkedin = true
        if @attendee.save
          redirect_to checkin_path
        else
          flash[:danger] = "Oops!! We have a problem Checking Users In"
          redirect_to checkin_path
        end
    end


    def destroy
      @register = UserRegister.find(params[:id])
      @register.destroy
      flash[:success] = "User Registration has been removed from event"
      redirect_to user_path(@register.user_id)
    end


    private

    def require_user
        if !logged_in?
        flash[:danger] = "You must be logged in"
        redirect_to login_path
        end
    end

    def require_admin
      if !logged_in? or (logged_in? && !current_user.admin?)
        flash[:danger] = "You must be an admin to check in users to events"
        redirect_to user_path(current_user)
      end
    end



end