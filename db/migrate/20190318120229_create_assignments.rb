class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.datetime :due_date
      t.integer :max_score
      t.text :description
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
