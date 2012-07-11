class CreateEntriesResearchLines < ActiveRecord::Migration
  def up
    create_table :entries_research_lines, :id => false do |t|
      t.references :entry
      t.references :research_line
    end
  end

  def down
    drop_table :entries_research_lines
  end
end
