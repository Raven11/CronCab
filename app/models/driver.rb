class Driver < ActiveRecord::Base
  #validates :mobile, numericality: {only_integer: true}, presence: true, length: {is: 10}
  #validates :password, length: {minimum: 8}, presence:true
  #validates :license_no, :pan_no, :status, presence: true
  belongs_to :image, :foreign_key => :image_id 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable

  accepts_nested_attributes_for :image
end
