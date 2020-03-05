module Guest
  class ServicesController < ApplicationController
    before_action :find, only: [:show]
     def index
      @services = Service.all
      authorize [:guest, @service]
    end

    def show
      authorize [:guest, @service]
    end

    private

    def find
      @service = Service.find(params[:id])
      authorize [:guest, @service]
    end
  end
end


