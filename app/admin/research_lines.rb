ActiveAdmin.register ResearchLine do
  index do
    selectable_column
    column :name, :sortable => :name do |research_line|
      link_to research_line.name, [:admin, research_line]
    end
    column :created_at
    column :updated_at
    default_actions
  end
end
