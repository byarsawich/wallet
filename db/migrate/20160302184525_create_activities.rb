class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :reciever_id
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :activities, :reciever_id
  end
end
