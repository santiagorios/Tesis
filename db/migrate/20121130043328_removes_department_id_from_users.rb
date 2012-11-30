class RemovesDepartmentIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :department_id
  end

  def down
    add_column :users, :department_id, :integer
  end
end
