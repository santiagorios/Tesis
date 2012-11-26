class CreateProgramsKnowlegdeAreasTable < ActiveRecord::Migration
  def up
    create_table :programs_knowledge_areas, :id => false do |t|
      t.references :program
      t.references :knowledge_area
    end
  end

  def down
    drop_table :programs_knowledge_areas
  end
end
