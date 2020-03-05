module Guest
  class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :create]

    def index
      @bookings = policy_scope(Booking).where(user_id: current_user)
       authorize [:guest, @booking]
    end

    def new
      @booking = Booking.new
      authorize [:guest, @booking]
    end

    def show
       authorize [:guest, @booking]
    end

    def create
      @booking = Booking.new(booking_params)
      authorize @booking

      respond_to do |format|
        if @booking.save
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          # format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          # format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:check_in, :check_out, :booking_number)
    end

  end
end
