class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.integer :grade
      t.string :classname
      t.boolean :elected, null: false, default: false

      t.timestamps
    end
  end
end
