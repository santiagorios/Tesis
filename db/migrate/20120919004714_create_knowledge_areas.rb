class CreateKnowledgeAreas < ActiveRecord::Migration
  def change
    create_table :knowledge_areas do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
