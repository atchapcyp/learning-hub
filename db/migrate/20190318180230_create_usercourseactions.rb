class CreateUsercourseactions < ActiveRecord::Migration[5.2]
  def change
    create_table :usercourseactions do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :status

      t.timestamps
    end
  add_index :usercourseactions, [:user_id, :course_id]
  end
end
