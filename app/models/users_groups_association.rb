class UsersGroupsAssociation < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :research_group
  validates_uniqueness_of :user_id, :scope => :research_group_id
end
