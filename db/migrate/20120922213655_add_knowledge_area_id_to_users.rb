class AddKnowledgeAreaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :knowledge_area_id, :integer
  end
end
