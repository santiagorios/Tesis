class DeleteIndicators < ActiveRecord::Migration
  def change
    drop_table :indicators
  end
end
