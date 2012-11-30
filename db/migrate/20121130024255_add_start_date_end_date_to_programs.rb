class AddStartDateEndDateToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :start_date, :date
    add_column :programs, :end_date, :date
  end
end
