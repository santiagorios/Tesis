class Role < ActiveRecord::Base
  has_many :users_groups_associations
  has_many :users_projects_associations
end
