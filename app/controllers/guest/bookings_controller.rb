module Guest
  class BookingsController < ApplicationController
    before_action :find, only: [:show, :create]

    def index
      @bookings = policy_scope(Booking).where(user_id: current_user)
       authorize @bookings
    end

    def new
      @booking = Booking.new
      authorize @booking
    end

    def show
       authorize @booking
    end

    def create
      @booking = Booking.new(params)
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

    def find
      @booking = Booking.find(params[:id])
      authorize @booking
    end

    def params
      params.require(:booking).permit(:check_in, :check_out, :booking_number)
    end

  end
end
