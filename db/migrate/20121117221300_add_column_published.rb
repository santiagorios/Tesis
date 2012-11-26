class AddColumnPublished < ActiveRecord::Migration
  def change
    add_column :programs, :published, :boolean
    add_column :projects, :published, :boolean
    add_column :results, :published, :boolean
  end

end
