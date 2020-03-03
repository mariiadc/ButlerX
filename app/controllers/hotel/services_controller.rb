module Hotel
  class ServicesController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
        @services = Service.all
        authorize @services
    end

    def new
      @service = Service.new
      authorize @service
    end

    def show
      authorize @service
    end

    def create
      @service = Service.new(params)
      authorize @service

          respond_to do |format|
        if @service.save
          format.html { redirect_to @service, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @service.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      authorize @service
    end

    def update
      @service.save
      authorize @service
    end

    def destroy
      @service.destroy
      authorize @service
    end

     private

    def find
      @service = Service.find(params[:id])
      authorize @service
    end

    def params
      params.require(:service).permit(:name, :desription, :photo, :category, :price)
    end
  end
end


