class Department < ActiveRecord::Base
  has_many :users
  has_many :knowledge_areas
  has_many :entries, :through => :users
end
