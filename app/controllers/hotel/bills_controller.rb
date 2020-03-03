module Hotel
  class BillController < ApplicationController
    before_action :find, only: [:show]
    def index
      @bills = Bill.all
      authorize @bills
    end

    def show
      authorize @bill
    end

    private

    def find
      @bill = Bill.find(params[:id])
      authorize @bill
    end

    def params
      params.require(:bill).permit(:booking_number)
    end
  end
end

