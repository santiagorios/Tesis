class RenameUsersGroupsTable < ActiveRecord::Migration
  def up
    rename_table :users_research_groups, :research_groups_users
  end

  def down
    rename_table :research_groups_users, :users_research_groups
  end
end
