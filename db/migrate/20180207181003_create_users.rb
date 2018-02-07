class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string :city
      t.string :state
      t.string :zip
      t.string :university
      t.string :degree
      t.integer :grad_year

      t.timestamps
    end
  end
end
