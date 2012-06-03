class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :date
      t.boolean :published
      t.text :body

      t.timestamps
    end
  end
end
