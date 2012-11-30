class AddsKnowledgeAreaIdToResearchSubline < ActiveRecord::Migration
  def change
    add_column :research_sublines, :knowledge_area_id, :integer
  end
end
