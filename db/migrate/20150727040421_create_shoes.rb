class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :size
      t.string :condition
      t.integer :asking_price
      t.string :image
      t.integer :user_id

      t.references :user, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
