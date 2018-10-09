require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
	@w = WeatherService.get(params[:city])
		if @w
			@temperature = (9 / 5) * (@w[:temperature] - 273) + 32
			city = City.new(
				name: params[:city],
				temperature: @temperature,
				description: @w[:description]
			)
			city.save
		end
	end
end
