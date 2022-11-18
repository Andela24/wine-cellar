class BottlesController < ApplicationController
    before_action only: [:show, :update, :destroy]
    skip_before_action :authenticate_user
    # before_action :authorize_user, only: [:update, :destroy]
   
    # GET/ bottles
    def index
        @bottles = Bottle.all
        render json: @bottles, status: :ok
    end

    # POST /bottles
    def create
        @bottle=Bottle.create(bottle_params)
        render json: @bottle, status: :created
    end

    #PATCH/PUT/bottles/1
    def update
        @bottle = Bottle.find(params[:id])
        @bottle.update!(bottle_params)
        render json: @bottle,  status: :accepted
    end

    #DELETE/bottles/1
    def destroy
        @bottle = Bottle.find(params[:id])
        @bottle.destroy
    end

    private 

    def bottle_params 
        params.require(:bottle).permit(:title, :wine_type, :grape_variety, :vintage, :user_id, :winery_id)
    end

    # def authorize_user
    #     permitted = current_user.id == @bottle.user_id
    #     render json: {errors:{User: "did not write this spell"}}, status: :forbidden unless permitted
    #   end


    # def set_bottle 
    #     @bottle = Bottle.find(params[:id])
    #  end
end
