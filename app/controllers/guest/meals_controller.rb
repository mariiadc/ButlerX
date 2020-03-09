module Guest
  class MealsController < ApplicationController
    before_action :find, only: [:show]
    def index
      @meals = policy_scope([:guest, Meal])
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])
    end

    def show
      authorize @meal
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])
    end

    private

    def find
      @meal = Meal.find(params[:id])
      authorize @meal
    end
  end
end
