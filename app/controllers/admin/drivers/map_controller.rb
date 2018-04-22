class Admin::Drivers::MapController < ApplicationController
  respond_to :html

  def index
	@drivers = Driver.all
	respond_with @drivers
  end
end
