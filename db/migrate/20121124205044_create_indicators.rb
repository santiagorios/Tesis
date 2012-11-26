class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.text :description
      t.integer :program_id

      t.timestamps
    end
  end
end
