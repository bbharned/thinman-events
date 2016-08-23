class EventsController < ApplicationController


    def new
        @event = Event.new
    end



    def create
        #render plain: params[:event].inspect
        @event = Event.new(event_params)
        if @event.save
            flash[:success] = "Event successfully created"
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end



    def index

    end



    def show

    end




    private

    def event_params
        params.require(:event).permit(:title, :description, :time, :cost, :capacity)
    end


end