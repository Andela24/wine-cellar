class WineriesController < ApplicationController
    skip_before_action :authenticate_user
    before_action :set_winery, only: [:show, :update, :destroy]
  
    # GET / wineries
      def index
          @wineries = Winery.all
          render json: @wineries, status: :ok
        end
  
       # POST /wineries
        def create
          @winery = Winery.create(winery_params)
          render json: @winery, status: 201
        end
      
      #PATCH/PUT /wineries/1
        def update
          winery = find_winery
          winery.update!(winery_params)
          render json: winery, status: :ok
        end
      
        private
      
        def find_winery
          @winery = Winery.find(params[:id])
        end
      
        def winery_params
          params.permit(:name)
        end
end
