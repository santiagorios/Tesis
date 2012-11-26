ActiveAdmin.register Department do
  index do
    selectable_column
    column :name, :sortable => :name do |department|
      link_to department.name, [:admin, department]
    end
    column :created_at
    column :updated_at
    default_actions
  end
end
