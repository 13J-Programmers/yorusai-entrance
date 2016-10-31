class AddBelongingToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :dept, :string      # M, E, S, J, C, AP, AE for grade 3..
    add_column :students, :class_id, :integer # 1, 2, 3, 4, 5 for grade 1..2
  end
end
