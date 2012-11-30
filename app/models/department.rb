class Department < ActiveRecord::Base
  self.per_page = 5
  has_many :users, :through => :knowledge_areas
  has_many :knowledge_areas
  has_many :entries, :through => :users
  has_many :programs, :through => :knowledge_areas
  has_many :projects, :through => :knowledge_areas

  def self.search(query)
    where do
      (name =~ "%#{query}%")
    end
  end

end
