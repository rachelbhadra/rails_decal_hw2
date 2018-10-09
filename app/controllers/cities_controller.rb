class CitiesController < ApplicationController
	def view
		@c = params[:city]
		@w = WeatherService.get(@c)
		if @w
			@temperature = (9 / 5) * (@w[:temperature] - 273) + 32
		end
	end

	def new
		
	end

	def create
		if !City.all.key?(params[:name].to_sym)
			@city = City.new(
				name: params[:name],
				landmark: params[:landmark],
				population: params[:population]
			)
			@city.save
		end
		redirect_to cities_view_path
	end

	def update
		if not params[:name].nil?
			if City.all.key?(params[:name].to_sym)
				@city = City.all[params[:name].to_sym]
				@city.update(landmark:params[:landmark], population:params[:population])
				@city.save
			end
			redirect_to cities_view_path
		end
	end
	
end