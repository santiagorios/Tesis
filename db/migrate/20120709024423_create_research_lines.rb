class CreateResearchLines < ActiveRecord::Migration
  def change
    create_table :research_lines do |t|
      t.string :name

      t.timestamps
    end
  end
end
