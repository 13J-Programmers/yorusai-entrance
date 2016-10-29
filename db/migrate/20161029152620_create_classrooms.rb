class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :class_id
      t.boolean :elected

      t.timestamps
    end
  end
end
