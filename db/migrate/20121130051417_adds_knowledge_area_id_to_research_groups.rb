class AddsKnowledgeAreaIdToResearchGroups < ActiveRecord::Migration
  def change
    add_column :research_groups, :knowledge_area_id, :integer
  end
end
