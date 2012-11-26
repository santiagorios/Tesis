class DropEntriesResearchLinesTableAndCreateEntriesResearchSublinesTable < ActiveRecord::Migration
  def change
    drop_table :entries_research_lines
    create_table :entries_research_sublines, :id => false do |t|
      t.references :entry
      t.references :research_subline
    end
  end
end
