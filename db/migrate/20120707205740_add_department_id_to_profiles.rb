class AddDepartmentIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :department_id, :integer
  end
end
