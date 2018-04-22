class Image < ActiveRecord::Base
  	mount_uploader :picture, PictureUploader
  	has_one :driver, :foreign_key => :image_id 
  	accepts_nested_attributes_for :driver
end
