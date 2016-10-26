class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :student_id
      t.boolean :attended
      t.boolean :elected

      t.timestamps
    end
  end
end
