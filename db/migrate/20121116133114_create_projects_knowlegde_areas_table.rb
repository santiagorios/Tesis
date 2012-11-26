class CreateProjectsKnowlegdeAreasTable < ActiveRecord::Migration
  def up
    create_table :projects_knowledge_areas, :id => false do |t|
      t.references :project
      t.references :knowledge_area
    end
  end

  def down
    drop_table :projects_knowledge_areas
  end
end
