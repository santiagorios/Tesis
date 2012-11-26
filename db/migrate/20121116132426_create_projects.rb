class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.integer :program_id
      t.integer :user_id

      t.timestamps
    end
  end
end
