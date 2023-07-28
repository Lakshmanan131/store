class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :student_id
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end
