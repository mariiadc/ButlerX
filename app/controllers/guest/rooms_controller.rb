module Guest
  class RoomsController < ApplicationController

    def show
      @room = Room.find(params[:id])
      authorize [:guest, @room]
    end

  end
end

