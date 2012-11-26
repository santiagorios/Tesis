class AddResultIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :result_id, :integer
  end
end
