class RenameTypeColumnToTypeOfProgram < ActiveRecord::Migration
  def change
    rename_column(:programs, :type, :type_of_program)
  end
end
