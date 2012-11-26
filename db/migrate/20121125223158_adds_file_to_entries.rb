class AddsFileToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :file, :string
  end
end
