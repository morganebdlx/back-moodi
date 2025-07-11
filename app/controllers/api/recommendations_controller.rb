class Api::RecommendationsController < ApplicationController
   def create
    service = OpenAIService.new(
      user_data: params[:user],
      weather_data: params[:weather]
    )
    ai_response = service.call

    render json: { recommendations: ai_response }
  end
end
