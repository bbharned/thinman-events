class EventsController < ApplicationController
    before_action :set_event, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @events = Event.paginate(page: params[:page], per_page: 5)
    end


    def new
        if logged_in? && current_user.admin?
            @event = Event.new
        else
            flash[:success] = "Only Admins can create events"
            redirect_to events_path
        end
    end

    def edit
    end



    def create
        #render plain: params[:event].inspect
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save
            flash[:success] = "Event successfully created"
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def update
        if @event.update(event_params)
            flash[:success] = "Event successfully updated"
            redirect_to event_path(@event)
        else
            render 'edit'
        end
    end


    def show
    end

    

    def destroy
      if @event.destroy
        flash[:danger] = "Event has been deleted and removed."
        redirect_to events_path
      else
        flash[:danger] = "There was a problem removing the event."
        redirect_to events_path
      end
    end


    private

    def event_params
        params.require(:event).permit(:title, :description, :time, :cost, :capacity)
    end

    def set_event
        @event = Event.find(params[:id])
    end

    def require_same_user
        if current_user != @event.user and !current_user.admin?
            flash[:danger] = "You can only edit or delete your own event."
            redirect_to events_path
    end

end


end