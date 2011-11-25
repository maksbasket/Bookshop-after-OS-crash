class RenameParentId < ActiveRecord::Migration
  def change
    rename_column :comments, :parent_id, :reply_to
  end
end
