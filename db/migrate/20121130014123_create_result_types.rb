class CreateResultTypes < ActiveRecord::Migration
  def change
    create_table :result_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
