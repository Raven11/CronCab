#module Api
	#	module V1
	#		module Drivers
	class LocationsController < WebsocketRails::BaseController
		before_action :authenticate
		def initialize_session

		end

		def create
			@location = params[:location]
			$redis.set(@driver.id,@location)
			render json: {}, status: 200
		end

		def authenticate
			token = params[:token]	
			if token.nil?
				respond_with status: 401 if token.nil?
				return
			end
			@driver = Driver.where(api_key: token).first if token
			if @driver.nil?					
				render json: {:is_authorized => "false"}, status: 401
				return
			end
		end

	end
	#		end
	#	end
#end
