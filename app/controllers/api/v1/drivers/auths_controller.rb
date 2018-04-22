require 'securerandom'
require 'json'

module Api
	module V1
		module Drivers
			class AuthsController < ApplicationController
				before_action :authenticate, except: [:create, :new]
				skip_before_action :verify_authenticity_token
				skip_before_action :authenticate_user!
				respond_to :json

				def show
					render json: {:name => @driver.name, :mobile => @driver.mobile, :image => @driver.image}, status: 200
				end

				def create
					api_key = generate_api_key
					@driver = Driver.find_by(mobile: params[:mobile])
					if @driver.nil? or !@driver.valid_password?(params[:password])
						render json: {:is_authorized => "false"}, status: 401 
						return
					else
						@driver.api_key = api_key						
						@driver.save
						render json: {:token => @driver.api_key, :name => @driver.name, :mobile => @driver.mobile, :image => @driver.image}, status: 200
					end
				end		

				def destroy
					@driver.api_key = nil
					@driver.save
					#@driver.destroy
					render json: {}, status: 200
				end
				private
				def generate_api_key
					loop do
						token = SecureRandom.base64.tr('+/=', 'Qrt')
						break token unless Driver.exists?(api_key: token)
					end
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
		end
	end
end
