class AddFinishedToProgramsAndProjects < ActiveRecord::Migration
  def change
    add_column :programs, :finished, :boolean
    add_column :projects, :finished, :boolean
  end
end
