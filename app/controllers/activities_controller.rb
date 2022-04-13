class ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end

  def destroy
    activity = Activity.find_by(id: params[:id])
    if activity
      activity.destroy
    else
      render json: { error: "Activity not found"}, status: 404
    end
  end
end
