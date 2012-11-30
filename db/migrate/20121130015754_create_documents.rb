class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :file
      t.integer :result_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
