class KnowledgeArea < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :entries
  belongs_to :department
end
