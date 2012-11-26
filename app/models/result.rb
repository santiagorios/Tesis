class Result < ActiveRecord::Base
  self.per_page = 5
  belongs_to :user
  belongs_to :project
  has_many :images, :dependent => :destroy
  attr_accessible :images_attributes, :title, :description, :published, :file, :project_id

  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true


  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

  def author
    user.name
  end

  def self.search(query)
    where do
      (title =~ "%#{query}%") | (description =~ "%#{query}%")
    end
  end

  attr_accessible :file, :remote_file_url
  mount_uploader :file, FileUploader
end
