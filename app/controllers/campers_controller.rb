class CampersController < ApplicationController
  def index
    render json: Camper.all
  end

  def show
    camper = Camper.find_by_id(params[:id])
    if camper
      render json: camper, serializer: CampersActivitiesSerializer
    else
      render json: {error: "Camper not found"}, status: 404
    end
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: 201
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: [invalid.message]}, status: 422
  end

  private

  def camper_params
    params.permit(:name, :age)
  end
end
