module Hotel
  class BillController < ApplicationController
    before_action :find, only: [:show]
    def index
      @bills = Bill.all
      authorize  [:hotel, @bill]
    end

    def show
      authorize [:hotel, @bill]
    end

    private

    def find
      @bill = Bill.find(params[:id])
      authorize  [:hotel, @bill]
    end

    def bill_params
      params.require(:bill).permit(:booking_number)
    end
  end
end

