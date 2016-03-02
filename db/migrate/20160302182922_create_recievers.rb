class CreateRecievers < ActiveRecord::Migration
  def change
    create_table :recievers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
