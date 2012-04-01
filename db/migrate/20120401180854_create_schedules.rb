class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :description
      t.date :date
      t.boolean :remember_me
      t.integer :user_id

      t.timestamps
    end
    add_index :schedules, :user_id
  end
end
