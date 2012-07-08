class RemoveDepartmentIdFromProfiles < ActiveRecord::Migration
  def up
  	remove_column :profiles, :department_id
  end

  def down
  	add_column :profiles, :department_id, :integer
  end
end
