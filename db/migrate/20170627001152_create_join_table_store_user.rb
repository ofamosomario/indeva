class CreateJoinTableStoreUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :stores, :users do |t|
    	t.integer :store_id
    	t.integer :user_id
    end
  end
end
