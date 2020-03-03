module Guest
  class RoomsController < ApplicationController

    def show
      @room = Room.find(params[:id])
      authorize @room
    end

  end
end

