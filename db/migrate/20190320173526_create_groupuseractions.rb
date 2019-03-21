class CreateGroupuseractions < ActiveRecord::Migration[5.2]
  def change
    create_table :groupuseractions do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
    add_index :groupuseractions, [:user_id, :group_id]
  end
end
