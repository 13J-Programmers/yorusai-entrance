class AddColumnToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :attended_at, :datetime
    add_column :students, :elected_at,  :datetime
    add_column :students, :grade,       :integer # 1,2,3,4,5 + 6,7
  end
end
