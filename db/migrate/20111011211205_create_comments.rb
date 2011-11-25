class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :text
      t.integer :product_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
