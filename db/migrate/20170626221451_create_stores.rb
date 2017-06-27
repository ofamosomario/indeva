class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.integer :user_id
      
      t.string :name, limit: 120, null: false

      t.timestamps
    end
  end
end
