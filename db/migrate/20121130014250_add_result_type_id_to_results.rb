class AddResultTypeIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :result_type_id, :integer
  end
end
