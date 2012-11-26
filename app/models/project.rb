# encoding: utf-8

require 'chronic'
require 'chronic_duration'

class Project < ActiveRecord::Base
  self.per_page = 5
  has_and_belongs_to_many :research_sublines
  has_and_belongs_to_many :knowledge_areas
  belongs_to :user
  belongs_to :program
  has_many :results

  attr_accessible :title, :description, :published, :program_id, :start_date, :end_date


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
    user == owner
  end

  def author
    user.name
  end

  attr_reader :state
  def state
    unless start_date.nil? or end_date.nil?
      now = DateTime.now.to_date
      if start_date < now and end_date > now # in progress
        "in_progress"
      elsif now < start_date #  pending
        "pending"
      elsif now > end_date  # finished
        "finished"
      else
        4 # unknown
      end
    else
      4
    end

  end

  attr_reader :duration
  attr_accessible :duration

  def duration=(string)
    years_string = string[/\d+\s+(years|year|años|año|anos|ano|anios|anio)/]
    months_string = string[/\d+\s+(months|month|meses|mes)/]
    days_string = string[/\d+\s+(days|day|días|día|dias|dia)/]

    unless years_string.blank?
      years = Integer(years_string[/\d+/])
    else
      years = 0
    end
    unless months_string.blank?
      months = Integer(months_string[/\d+/])
    else
      months = 0
    end
    unless days_string.blank?
      days = Integer(days_string[/\d+/])
    else
      days = 0
    end


    self.end_date = start_date + years.years + months.months + days.days
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
