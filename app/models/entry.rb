class Entry < ActiveRecord::Base
	belongs_to :user
	validates :title, :presence => true
	self.per_page = 5
	after_initialize :default_values

	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
	attr_accessible :images_attributes, :title, :body, :date, :published
	
	has_and_belongs_to_many :research_lines

	attr_reader :research_line_names
	attr_accessible :research_line_names

  def research_line_names=(names)
  	research_lines = Array.new
  	for name in names 
  		research_line = ResearchLine.find_or_create_by_name(name)
  		research_lines.push(research_line)
  	end
    self.research_lines = research_lines
  end


  has_and_belongs_to_many :knowledge_areas

  attr_reader :knowledge_area_names
  attr_accessible :knowledge_area_names

  def knowledge_area_names=(names)
    knowledge_areas = Array.new
    for name in names
      knowledge_area = KnowledgeArea.find_or_create_by_name(name)
      knowledge_areas.push(knowledge_area)
    end
    self.knowledge_areas = knowledge_areas
  end

	def owned_by?(owner)
		return false unless owner.is_a? User
		user == owner
	end

	def author
		if user.profile.name.nil? or user.profile.name.empty?
      user.email
    else
      user.profile.name
		end
	end

	private
		def default_values
			self.date ||= Time.now.strftime("%Y-%m-%d")
		end
end
