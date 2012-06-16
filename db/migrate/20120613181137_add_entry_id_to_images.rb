class AddEntryIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :entry_id, :integer
  end
end
