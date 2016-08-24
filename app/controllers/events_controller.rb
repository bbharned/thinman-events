class EventsController < ApplicationController

    def index
        @events = Event.all
    end


    def new
        @event = Event.new
    end

    def edit
        @event = Event.find(params[:id])
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

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            flash[:notice] = "Event successfully updated"
            redirect_to event_path(@event)
        else
            render 'edit'
        end
    end


    def show
        @event = Event.find(params[:id])
    end

    

    def destroy
      @event = Event.find(params[:id])
      if @event.destroy
        flash[:notice] = "Event has been removed."
        redirect_to events_path
      else
        flash[:notice] = "There was a problem removing the event."
        redirect_to events_path
      end
    end


    private

    def event_params
        params.require(:event).permit(:title, :description, :time, :cost, :capacity)
    end


end