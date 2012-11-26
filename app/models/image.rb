class Image < ActiveRecord::Base
	belongs_to :entry
  belongs_to :result
	attr_accessible :entry_id, :result_id, :title, :image, :remote_image_url
	mount_uploader :image, ImageUploader
end
