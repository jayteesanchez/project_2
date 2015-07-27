class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :index
      t.string :new
      t.string :edit
      t.string :show

      t.timestamps null: false
    end
  end
end
