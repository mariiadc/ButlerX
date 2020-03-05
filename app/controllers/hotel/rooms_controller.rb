module Hotel
  class RoomsController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
      @rooms = Room.all
      authorize [:hotel, @rooms]
    end

    def new
      @room = Room.new
      authorize [:hotel, @rooms]
    end

    def show
    end

    def create
      @room = Room.new(room_params)
      authorize [:hotel, @rooms]

        respond_to do |format|
        if @room.save
          format.html { redirect_to @room, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      authorize [:hotel, @rooms]
    end

    def update
      @room.save
      authorize [:hotel, @rooms]
    end

    def destroy
      @room.destroy
      authorize [:hotel, @rooms]
    end

     private

    def find
      @room = Room.find(params[:id])
      authorize  [:hotel, @rooms]
    end

    def room_params
      params.require(:room).permit(:name, :room_number) #availability ?
    end
  end
end


