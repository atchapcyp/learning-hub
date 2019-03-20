class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :work
      t.string :score
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :courses, :id
  end
end
