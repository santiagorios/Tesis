class ChangeDataTypeForDate < ActiveRecord::Migration
  def up
  	change_column(:entries, :date, :date)
  end

  def down
  	change_column(:entries, :date, :datetime)
  end
end
