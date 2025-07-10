require 'net/http'
require 'uri'
require 'json'

class WeatherController < ApplicationController
  def show
    location = params[:location]
    key = ENV["WEATHER_API_KEY"]
    url = URI("http://api.weatherapi.com/v1/current.json?key=#{key}&q=#{location}&lang=fr")

    response = Net::HTTP.get(url)
    weather_data = JSON.parse(response)

    render json: weather_data
  end

end
