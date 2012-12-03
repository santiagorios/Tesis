class CreateUsersProjectsAssociations < ActiveRecord::Migration
  def change
    create_table :users_projects_associations do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :project_id

      t.timestamps
    end
  end
end
