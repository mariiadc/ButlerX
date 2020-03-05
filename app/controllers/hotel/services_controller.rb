module Hotel
  class ServicesController < ApplicationController
    before_action :find, only: [:show, :create, :edit, :update, :destroy]
    def index
        @services = Service.all
        authorize [:hotel, @services]
    end

    def new
      @service = Service.new
      authorize [:hotel, @services]
    end

    def show
      authorize [:hotel, @services]
    end

    def create
      @service = Service.new(service_params)
      authorize [:hotel, @services]

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
      authorize [:hotel, @services]
    end

    def update
      @service.save
      authorize [:hotel, @services]
    end

    def destroy
      @service.destroy
      authorize [:hotel, @services]
    end

     private

    def find
      @service = Service.find(params[:id])
      authorize @service
    end

    def service_params
      params.require(:service).permit(:name, :desription, :photo, :category, :price)
    end
  end
end


