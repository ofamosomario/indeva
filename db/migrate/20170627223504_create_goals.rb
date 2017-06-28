class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :store_id
      
      t.string :name, limit: 120, null: false
      t.integer :month, limit: 1, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.decimal :total_value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
