class Indicator < ActiveRecord::Base
  belongs_to :program
  attr_accessible :name, :description, :program_id
end
