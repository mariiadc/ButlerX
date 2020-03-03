module Guest
  class MealsController < ApplicationController
    before_action :find, only: [:show]
    def index
      @meals = Meal.all
      authorize @meals
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
