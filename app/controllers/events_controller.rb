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
            flash[:danger] = "Only Admins can create events"
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
      @schedules = UserRegister.where(event_id: @event.id)  
      if @event.destroy
        flash[:danger] = "Event has been deleted and removed."
        if @schedules.any?
            @schedules.destroy_all
        end
        redirect_to events_path
      else
        flash[:danger] = "There was a problem removing the event."
        redirect_to events_path
      end
    end


    private

    def event_params
        params.require(:event).permit(:title, :description, :eventtime, :cost, :capacity, venue_ids: [], category_ids: [], user_ids: [])
    end

    def set_event
        @event = Event.find(params[:id])
    end

    def require_same_user
        if !logged_in? || (current_user != @event.user and !current_user.admin?)
            flash[:danger] = "You are not allowed to perform that action."
            redirect_to events_path
        end
    end


end