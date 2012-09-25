class RenameKnowledgeAreaTitleColumn < ActiveRecord::Migration
  def up
    rename_column(:knowledge_areas, :title, :name)
  end

  def down
    rename_column(:knowledge_areas, :name, :title)
  end
end
