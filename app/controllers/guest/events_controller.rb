module Guest
  class EventsController < ApplicationController
    before_action :find, only: [:show]

    def index
      @events = Event.all
       authorize @events
    end

    def show
    end

  private

    def find
      @event = Event.find(params[:id])
      authorize @event
    end
  end
end
