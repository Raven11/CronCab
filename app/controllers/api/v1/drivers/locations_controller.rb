require 'json'
module Api
	module V1
		module Drivers
			class LocationsController < WebsocketRails::BaseController

				before_action :authenticate
				def initialize_session

				end

				def set_location
					response = "location added"
					failure_response = "Invalid location params"
					begin
						location = message[:location]
						location_driver_id = "location_driver_#{@driver.id}"
						location["time_stamp"] = Time.now.to_i
						$redis.set(location_driver_id, location.to_json)
						trigger_success response
					rescue
						trigger_failure = failure_response
					end
				end

				private
				def authenticate
					token = message[:auth][:token]	
					response = "UnAuthenticated"
					if token.nil?
						trigger_failure response
						return
					end
					@driver = Driver.where(api_key: token).first
					if @driver.nil?		
						trigger_failure response
						return
					end
				end

			end
		end
	end
end
