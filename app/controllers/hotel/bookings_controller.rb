module Hotel
  class BookingsController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
      @bookings = Bookings.all
      authorize [:hotel, @booking]
    end

    def new
      @booking = Booking.new
      authorize [:hotel, @booking]
    end

    def show
      authorize [:hotel, @booking]
    end

    def create
      @booking = Booking.new(booking_params)

      booking_room_key

      authorize [:hotel, @booking]

      respond_to do |format|
        if @booking.save
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      authorize [:hotel, @booking]
    end

    def update
      @booking.save
      authorize [:hotel, @booking]
    end

    def destroy
      @booking.destroy
      authorize [:hotel, @booking]
    end

     private

    def find
      @booking = Booking.find(params[:id])
      authorize [:hotel, @booking]
    end

    def booking_params
      params.require(:booking).permit(:check_in, :check_out, :booking_number)
    end

    def booking_room_key
      guest = User.find(@booking.guest_id)
      hotel = User.find(@booking.hotel_id)
      @room = Room.find(@booking.room_id)
      room_info = "Room booked for #{guest.first_name} #{guest.last_name}, on #{hotel.name} between #{@booking.check_in} and #{@booking.check_out}. Booking number is: #{@booking.booking_number}. Room: #{@room.room_number}."
      @room.key = room_info
      # its commented out, because active record only records strings. not qr_codes.
      # qr_code = RQRCode::QRCode.new(room_info)
      # @room.key = qr_code
      @room.save!
    end

  end
end
