class CreateResearchSublines < ActiveRecord::Migration
  def change
    create_table :research_sublines do |t|
      t.string :name
      t.integer :research_line_id

      t.timestamps
    end
  end
end
