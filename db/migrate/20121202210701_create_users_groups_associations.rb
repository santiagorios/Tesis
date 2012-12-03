class CreateUsersGroupsAssociations < ActiveRecord::Migration
  def change
    create_table :users_groups_associations do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :research_group_id

      t.timestamps
    end
  end
end
