class AddColumnToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :attended_at, :datetime
    add_column :students, :elected_at,  :datetime
  end
end
