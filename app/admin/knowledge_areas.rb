ActiveAdmin.register KnowledgeArea do
  index do
    selectable_column
    column :name, :sortable => :name do |knowledge_area|
      link_to knowledge_area.name, [:admin, knowledge_area]
    end
    column :department
    column :created_at
    column :updated_at
    default_actions
  end
end
