class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.integer :zip_code
      t.string :state
      t.string :password_digest
      t.string :image

      t.timestamps null: false
    end
  end
end
