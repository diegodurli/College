class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :status
      t.integer :semester
      t.integer :user_id

      t.timestamps
    end
    add_index :subjects, :status
    add_index :subjects, :user_id
  end
end
