class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.date :birthday
      t.string :department
      t.string :phone
      t.text :about_me

      t.timestamps
    end
  end
end
