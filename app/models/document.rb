class Document < ActiveRecord::Base
  attr_accessible :name, :file, :remote_file_url
  mount_uploader :file, FileUploader

  belongs_to :result
  belongs_to :entry
end
