module Hotel
  class EventsController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
      @events = Event.all
      authorize [:hotel, @events]
    end

    def new
      @event = Event.new
      authorize [:hotel, @events]
    end

    def show
      authorize [:hotel, @events]
    end

    def create
      @event = Event.new(event_params)
      authorize [:hotel, @events]

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
      authorize [:hotel, @events]
    end

    def update
      @event.save
      authorize [:hotel, @events]
    end

    def destroy
      @event.destroy
      authorize [:hotel, @events]
    end

     private

    def find
      @event = Event.find(params[:id])
      authorize [:hotel, @events]
    end

    def event_params
      params.require(:event).permit(:name, :photo, :description)
    end
  end
end
