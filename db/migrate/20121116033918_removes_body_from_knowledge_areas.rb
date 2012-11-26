class RemovesBodyFromKnowledgeAreas < ActiveRecord::Migration
  def up
    remove_column :knowledge_areas, :body
  end

  def down
    add_column :knowledge_areas, :body, :text
  end
end
