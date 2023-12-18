
class Api::V1::WeathersController < ApplicationController
  before_action :check_bad_request

  def search
    weather = WeatherForecast.call(query_params[:city])

    if weather.present?
      render json: weather
    else
      render json: { error: 'City not found' }, status: :bad_gateway
    end

  end

  private

  def query_params
    params.permit(:city)
  end

  def check_bad_request
    if query_params[:city].blank?
      render json: { error: 'Parameter is missing' }, status: :bad_request
      return
    end
  end
end

