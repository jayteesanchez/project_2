class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :condition
      t.integer :asking_price
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
