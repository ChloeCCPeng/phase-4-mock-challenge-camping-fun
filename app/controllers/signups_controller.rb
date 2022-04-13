class SignupsController < ApplicationController
  def create
    signup = Signup.create!(signup_params)
    render json: signup.activity, status: 201
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: [invalid.message]}, status: 422
  end

  private

  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end
end
