class Program < ActiveRecord::Base
  self.per_page = 5
  has_and_belongs_to_many :research_sublines
  has_and_belongs_to_many :knowledge_areas
  belongs_to :research_group
  belongs_to :user
  has_many :projects
  has_many :results, :through => :projects
  has_many :indicators, :dependent => :destroy
  belongs_to :program_type

  attr_accessible :title, :description, :published, :research_group_id, :indicators_attributes, :program_type_id
  accepts_nested_attributes_for :indicators, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true


  def knowledge_area_names=(names)
    knowledge_areas = Array.new
    for name in names
      knowledge_area = KnowledgeArea.find_by_name(name)
      unless knowledge_area.nil?
        knowledge_areas.push(knowledge_area)
      end
    end
    self.knowledge_areas = knowledge_areas
  end

  attr_reader :knowledge_area_names
  attr_accessible :knowledge_area_names

  attr_reader :research_subline_names
  attr_accessible :research_subline_names

  def research_subline_names=(names)
    research_sublines = Array.new
    for name in names
      research_subline = ResearchSubline.find_by_name(name)
      unless research_subline.nil?
        research_sublines.push(research_subline)
      end
    end
    self.research_sublines = research_sublines
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    if self.user == owner
      true
    elsif !self.research_group.nil?
      self.research_group.users.include?(owner)
    else
      false
    end
  end

  def state
    count_finished = 0
    count_in_progress = 0
    count_pending = 0
    unless self.projects.count == 0
      for project in projects
        if project.state == 1
          count_in_progress += 1
        elsif project.state == 2
          count_pending += 1
        elsif project.state == 3
          count_finished += 1
        else

        end
      end
    end


    if count_in_progress > 1
      "in_progress"
    elsif count_pending == projects.count  and projects.count > 0
      "pending"
    elsif count_finished == projects.count and projects.count > 0
      "finished"
    else
      4
    end
  end

  def self.search(query)
    where do
      (title =~ "%#{query}%") | (description =~ "%#{query}%")
    end
  end
end
