module Hotel
  class MealsController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
       @meals = Meal.all
       authorize @meals
    end

    def new
      @meal = Meal.new
      authorize @meal
    end

    def show
      authorize @meal
    end

    def create
       @meals = Meal.new(params)
       authorize @meal

        respond_to do |format|
        if @meal.save
          format.html { redirect_to @meal, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      authorize @meal
    end

    def update
      @meal.save
      authorize @meal
    end

    def destroy
      @meal.destroy
      authorize @meal
    end

     private

    def find
      @meal = Meal.find(params[:id])
      authorize @meal
    end

    def params
      params.require(:meal).permit(:name, :description, :price)
    end
  end
end
