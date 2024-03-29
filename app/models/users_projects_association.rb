class UsersProjectsAssociation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :role
  validates_uniqueness_of :user_id, :scope => :project_id
end
