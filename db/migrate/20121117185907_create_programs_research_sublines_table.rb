class CreateProgramsResearchSublinesTable < ActiveRecord::Migration
  def up
    create_table :programs_research_sublines, :id => false do |t|
      t.references :program
      t.references :research_subline
    end
  end

  def down
    drop_table :programs_research_sublines
  end
end
