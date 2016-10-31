class AddColumnToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :attended_at, :date
    add_column :students, :elected_at,  :date
  end
end
