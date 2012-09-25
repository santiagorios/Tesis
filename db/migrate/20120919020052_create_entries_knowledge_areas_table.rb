class CreateEntriesKnowledgeAreasTable < ActiveRecord::Migration
  def up
    create_table :entries_knowledge_areas, :id => false do |t|
      t.references :entry
      t.references :knowledge_area
    end
  end

  def down
    drop_table :entries_knowledge_areas
  end
end
