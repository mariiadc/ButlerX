module Guest
  class ServicesController < ApplicationController
    before_action :find, only: [:show]
     def index
      @services = Service.all
      authorize @services
    end

    def show
      authorize @service
    end

    private

    def find
      @service = Service.find(params[:id])
      authorize @service
    end
  end
end


