class ResearchSubline < ActiveRecord::Base
  belongs_to :research_line
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :entries
  self.per_page = 5

  def self.search(query)
    where do
      (name =~ "%#{query}%")
    end
  end
end
