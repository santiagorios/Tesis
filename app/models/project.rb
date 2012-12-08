# encoding: utf-8

require 'chronic'
require 'chronic_duration'

class Project < ActiveRecord::Base
  self.per_page = 5
  has_and_belongs_to_many :research_sublines
  has_and_belongs_to_many :knowledge_areas
  has_many :users_projects_associations
  has_many :users, :through => :users_projects_associations
  belongs_to :user
  belongs_to :program
  has_many :results

  validates_presence_of :title
  validates_presence_of :program_id

  attr_accessible :title, :description, :published, :program_id, :start_date, :end_date, :finished, :users_projects_associations_attributes

  accepts_nested_attributes_for :users_projects_associations, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true

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
    knowledge_areas = Array.new
    for name in names
      research_subline = ResearchSubline.find_by_name(name)
      unless research_subline.nil?
        research_sublines.push(research_subline)
        unless research_subline.knowledge_area.nil?
          knowledge_areas.push(research_subline.knowledge_area)
        end
      end
    end
    self.research_sublines = research_sublines
    self.knowledge_areas = knowledge_areas
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner || self.users.include?(owner)
  end

  def author
    user.name
  end

  attr_reader :state
  def state
    unless start_date.nil? or end_date.nil?
      now = DateTime.now.to_date
      if finished #finished
        "finished"
      elsif start_date < now and end_date > now # in progress
        "in_progress"
      elsif now < start_date #  pending
        "pending"
      elsif now > end_date and !finished # expired
        "expired"
      else
        4 # unknown
      end
    else
      4
    end

  end

  attr_reader :duration_years
  attr_accessible :duration_years

  def duration_years=(string)
    unless string.blank?
      unless self.duration.nil? or self.duration.blank? or self.duration[/\d+\s+(months|month|meses|mes)/].nil?
        self.duration = self.duration[/\d+\s+(months|month|meses|mes)/] + " " + string
      else
        self.duration = string
      end
    end
  end

  def duration_years
    duration[/\d+\s+(years|year|años|año|anos|ano|anios|anio)/]
  end

  attr_reader :duration_months
  attr_accessible :duration_months

  def duration_months=(string)
    unless string.blank?
      unless self.duration.nil? or self.duration.blank? or self.duration[/\d+\s+(years|year|años|año|anos|ano|anios|anio)/].nil?
        self.duration = self.duration[/\d+\s+(years|year|años|año|anos|ano|anios|anio)/] + " " + string
      else
        self.duration = string
      end
    end
  end

  def duration_months
    duration[/\d+\s+(months|month|meses|mes)/]
  end


  attr_reader :duration
  attr_accessible :duration

  def duration=(string)
    years_string = string[/\d+\s+(years|year|años|año|anos|ano|anios|anio)/]
    months_string = string[/\d+\s+(months|month|meses|mes)/]
    days_string = string[/\d+\s+(days|day|días|día|dias|dia)/]

    unless years_string.blank? or years_string[/\d+/].nil?
      years = Integer(years_string[/\d+/])
    else
      years = 0
    end
    unless months_string.blank? or months_string[/\d+/].nil?
      months = Integer(months_string[/\d+/])
    else
      months = 0
    end
    unless days_string.blank? or days_string[/\d+/].nil?
      days = Integer(days_string[/\d+/])
    else
      days = 0
    end

    unless self.start_date.nil? or self.start_date.blank?
      self.end_date = start_date + years.years + months.months + days.days
    end
  end

  def duration
    unless self.start_date.nil? or self.end_date.nil?
      duration = self.end_date - self.start_date
      months = Integer(duration)/30
      output = ChronicDuration::output(months.months, :format => :long)
      output = output.gsub('year', 'año')
      output = output.gsub('months', 'meses')
      output = output.gsub('month', 'mes')
      output = output.gsub('day', 'día')
      output
    else
      ''
    end
  end

  def self.search(query)
    where do
      (title =~ "%#{query}%") | (description =~ "%#{query}%")
    end
  end
end
