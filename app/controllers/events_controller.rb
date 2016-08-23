class EventsController < ApplicationController


    def new
        @event = Event.new
    end



    def create
        #render plain: params[:event].inspect
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = "Event successfully created"
            redirect_to event_path(@event)
        else
            render :new
        end
    end



    def index
        @events = Event.all
    end



    def show
        @event = Event.find(params[:id])
    end




    private

    def event_params
        params.require(:event).permit(:title, :description, :time, :cost, :capacity)
    end


end