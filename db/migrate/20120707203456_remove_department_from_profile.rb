class RemoveDepartmentFromProfile < ActiveRecord::Migration
  def up
  	remove_column :profiles, :department
  end

  def down
  	add_column :profiles, :department, :string
  end
end
