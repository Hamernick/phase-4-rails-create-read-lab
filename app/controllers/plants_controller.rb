class PlantsController < ApplicationController
    wrap_parameters format: []
  
    # GET /plants
    def index
      render json: Plant.all
    end
  
    # POST /plants
    def create
      render json: Plant.create!(plant_params), status: :created
    end
  
    # GET /plants/:id
    def show
      plant = Plant.find_by(id: params[:id])
      if plant
        render json: plant
      else
        render json: { error: "plant not found" }, status: :not_found
      end
    end
  
    private
    
    def plant_params
      params.permit(:name, :image, :price)
    end
  
  end
  