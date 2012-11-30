class AddsProgramIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :program_id, :integer
  end
end
