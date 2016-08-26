class PagesController < ApplicationController

    
    def index 
        redirect_to events_path if logged_in?
    end


end