class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  def index
    campers = Camper.all 
    render json: campers, each_serializer: nil, status: :ok
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, status: :ok
  end

  def create
    camper = Camper.create!(camper_params)
  end


  private

  def render_not_found
    render json: {error: "Camper not found"}, staus: :not_found
  end

  def camper_params
    params.permit(:name, :age)
  end

  def render_invalid(invalid)
    
    
  end

end
