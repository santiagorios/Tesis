class Entry < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true
	self.per_page = 5
	after_initialize :default_values

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
	attr_accessible :images_attributes, :title, :body, :date, :published
	
	has_and_belongs_to_many :research_sublines

	attr_reader :research_subline_names
	attr_accessible :research_subline_names

  def research_subline_names=(names)
  	research_sublines = Array.new
  	for name in names 
  		research_subline = ResearchSubline.find_by_name(name)
  		research_sublines.push(research_subline)
  	end
    self.research_sublines = research_sublines
  end

  attr_accessible :file, :remote_file_url
  mount_uploader :file, FileUploader


  has_and_belongs_to_many :knowledge_areas

  attr_reader :knowledge_area_names
  attr_accessible :knowledge_area_names

  def knowledge_area_names=(names)
    knowledge_areas = Array.new
    for name in names
      knowledge_area = KnowledgeArea.find_by_name(name)
      knowledge_areas.push(knowledge_area)
    end
    self.knowledge_areas = knowledge_areas
  end

	def owned_by?(owner)
		return false unless owner.is_a? User
		user == owner
	end

	def author
		user.name
  end

  def self.search(query)
    where do
      (title =~ "%#{query}%") | (body =~ "%#{query}%")
    end
  end

	private
		def default_values
			self.date ||= Time.now.strftime("%Y-%m-%d")
      self.published = true
		end
end
