class Image < ActiveRecord::Base
	belongs_to :entry
	attr_accessible :entry_id, :title, :image, :remote_image_url
end
