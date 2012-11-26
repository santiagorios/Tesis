ActiveAdmin.register ResearchSubline do
  index do
    selectable_column
    column :name, :sortable => :name do |research_subline|
      link_to research_subline.name, [:admin, research_subline]
    end
    column :research_line
    column :created_at
    column :updated_at
    default_actions
  end
end
