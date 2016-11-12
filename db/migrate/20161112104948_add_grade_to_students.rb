class AddGradeToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :grade, :integer #, null: false, default: 0 # 1,2,3,4,5 + 6,7
  end
end
