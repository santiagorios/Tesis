class RemoveTypeOfProgramColumn < ActiveRecord::Migration
  def change
    remove_column :programs, :type_of_program
  end
end
