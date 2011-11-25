class AddLftAndRgtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :lft, :integer
    add_column :comments, :rgt, :integer
    rename_column :comments, :reply_to, :parent_id
  end
end
