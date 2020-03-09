module Guest
  class MealsController < ApplicationController
    before_action :find, only: [:show]
    def index
      @meals = policy_scope([:guest, Meal])
    end

    def show
      authorize @meal
    end

    private

    def find
      @meal = Meal.find(params[:id])
      authorize @meal
    end
  end
end
