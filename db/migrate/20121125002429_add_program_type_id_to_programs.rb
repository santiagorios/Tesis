class AddProgramTypeIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :program_type_id, :integer
  end
end
