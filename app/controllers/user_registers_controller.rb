class UserRegistersController < ApplicationController
    before_action :require_user

    def new
        @register = UserRegister.new
    end

    def create  
      @registers = UserRegister.all
      @event = Event.find(params[:event_id])
      @register = UserRegister.new(user_id: current_user.id, event_id: params[:event_id])
      @all_registered = @registers.where(event_id: @event.id)
      #@schedule =  UserRegister.where(event_id: @event.id, user_id: current_user.id)

      if @registers.any?{ |session| session.user_id == current_user.id and session.event_id == @event.id }

        flash[:danger] = "You Are Already Registered for This Event"
        redirect_to root_path

      elsif @event.capacity && @all_registered.count >= @event.capacity

        flash[:danger] = "Sorry, registration for this event is full"
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


    private

    def require_user
        if !logged_in?
        flash[:danger] = "You must be logged in to register for an event"
        redirect_to login_path
    end
    end



end