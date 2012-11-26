class KnowledgeArea < ActiveRecord::Base
  self.per_page = 5
  has_many :users
  has_and_belongs_to_many :entries
  belongs_to :department

  has_and_belongs_to_many :programs
  has_and_belongs_to_many :projects

  def self.search(query)
    where do
      (name =~ "%#{query}%")
    end
  end
end
