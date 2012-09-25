class AddDepartmentIdToKnowledgeAreas < ActiveRecord::Migration
  def change
    add_column :knowledge_areas, :department_id, :integer
  end
end
