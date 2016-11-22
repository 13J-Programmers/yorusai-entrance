class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.belongs_to :classroom
      t.integer :student_id
      t.boolean :attended, null: false, default: false
      t.boolean :elected, null: false, default: false

      t.timestamps
    end
  end
end
