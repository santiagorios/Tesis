class RemovesFileColumnFromEntriesAndResults < ActiveRecord::Migration
  def up
    remove_column :entries, :file
    remove_column :results, :file
  end

  def down
    add_column :entries, :file, :string
    add_column :results, :file, :string
  end
end
