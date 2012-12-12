class Result < ActiveRecord::Base
  self.per_page = 5
  belongs_to :user
  belongs_to :result_type
  belongs_to :project
  has_many :images, :dependent => :destroy
  attr_accessible :images_attributes, :title, :description, :published, :project_id, :result_type_id

  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true


  has_many :documents, :dependent => :destroy
  attr_accessible :documents_attributes

  accepts_nested_attributes_for :documents, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true


  validates_presence_of :title
  validates_presence_of :result_type_id
  validates_presence_of :project_id


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

end
