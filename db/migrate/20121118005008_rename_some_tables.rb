class RenameSomeTables < ActiveRecord::Migration
  def up
    rename_table :programs_knowledge_areas, :knowledge_areas_programs
    rename_table :projects_knowledge_areas, :knowledge_areas_projects
  end

  def down
    rename_table :knowledge_areas_programs, :programs_knowledge_areas
    rename_table :knowledge_areas_projects, :projects_knowledge_areas
  end
end
