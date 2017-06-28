class CreateDailyGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_goals do |t|
      t.integer :goal_id
      t.integer :user_id
      t.date :currently_date
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
