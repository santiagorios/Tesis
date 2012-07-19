class Profile < ActiveRecord::Base
	attr_accessible :user_id, :name, :birthday, :phone, :about_me, :image, :remote_image_url
	belongs_to :user
	mount_uploader :image, ImageUploader
end
