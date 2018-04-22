class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @drivers = Driver.includes(:image).all
    @images = Image.all
    respond_with(@drivers, @images)
  end

  def show
    respond_with(@driver)
  end

  def new
    @driver = Driver.new
    @image = @driver.build_image
    respond_with(@driver, @image)
  end

  def edit
    @image = @driver.build_image
    respond_with(@driver, @image)
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.save
    respond_with(@driver)
  end

  def update
    @driver.update(driver_params)
    respond_with(@driver)
  end

  def destroy
    @driver.destroy
    respond_with(@driver)
  end
  def admin_list
  	@drivers = Driver.all
  	respond_with(@drivers)
  end
  
  private
    def set_driver
      @driver = Driver.find(params[:id])
    end

    def driver_params
      params.require(:driver).permit(:name, :mobile, :license_no, :pan_no, :status, :password, image_attributes:[:picture])
    end
end
