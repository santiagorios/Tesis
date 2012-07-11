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

	def owned_by?(owner)
		return false unless owner.is_a? User
		user == owner
	end

	def author
		if user.present? && user.profile.present? && user.profile.name.present?
			user.profile.name
		end
	end

	private
		def default_values
			self.date ||= Time.now.strftime("%Y-%m-%d")
		end
end
