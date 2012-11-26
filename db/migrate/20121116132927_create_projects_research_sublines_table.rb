class CreateProjectsResearchSublinesTable < ActiveRecord::Migration
  def up
    create_table :projects_research_sublines, :id => false do |t|
      t.references :project
      t.references :research_subline
    end
  end

  def down
    drop_table :projects_research_sublines
  end
end
