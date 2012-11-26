class ResearchLine < ActiveRecord::Base
  has_many :research_sublines
  has_many :programs, :through => :research_sublines
  has_many :projects, :through => :research_sublines
  has_many :entries, :through => :research_sublines
  self.per_page = 5

  def self.search(query)
    where do
      (name =~ "%#{query}%")
    end
  end
end
