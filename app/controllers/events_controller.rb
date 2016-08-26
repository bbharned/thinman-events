class EventsController < ApplicationController
    before_action :set_event, only: [:edit, :update, :show, :destroy]

    def index
        @events = Event.paginate(page: params[:page], per_page: 5)
    end


    def new
        @event = Event.new
    end

    def edit
    end



    def create
        #render plain: params[:event].inspect
        @event = Event.new(event_params)
        @event.user = User.first
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


end