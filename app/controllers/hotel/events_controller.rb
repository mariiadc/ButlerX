module Hotel
  class EventsController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
      @events = Event.all
      authorize @events
    end

    def new
      @event = Event.new
      authorize @event
    end

    def show
      authorize @event
    end

    def create
      @event = Event.new(params)
      authorize @event

      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      authorize @event
    end

    def update
      @event.save
      authorize @event
    end

    def destroy
      @event.destroy
      authorize @event
    end

     private

    def find
      @event = Event.find(params[:id])
      authorize @event
    end

    def params
      params.require(:event).permit(:name, :photo, :description)
    end
  end
end
