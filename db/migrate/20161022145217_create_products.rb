class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :kind
      t.string :image
      t.string :describe
      t.string :age
      t.integer :contact, :limit => 20
      t.integer :zipcode
      t.string :size
      t.string :city

      t.timestamps null: false
    end
  end
end
