class ChangeTypeOfDescriptionToText < ActiveRecord::Migration
  def up
    change_column(:programs, :description, :text)
    change_column(:projects, :description, :text)
  end

  def down
    change_column(:programs, :description, :string)
    change_column(:projects, :description, :string)
  end
end
