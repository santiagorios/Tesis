class RenameNameColumnsToTitle < ActiveRecord::Migration
  def up
    rename_column(:programs, :name, :title)
    rename_column(:projects, :name, :title)
    rename_column(:results, :name, :title)
  end

  def down
    rename_column(:programs, :title, :name)
    rename_column(:projects, :title, :name)
    rename_column(:results, :title, :name)
  end
end
