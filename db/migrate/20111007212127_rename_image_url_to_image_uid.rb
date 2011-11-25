class RenameImageUrlToImageUid < ActiveRecord::Migration
  def up
    rename_column :products, :image_url, :image_uid
  end

  def down
    rename_column :products, :image_uid, :image_url
  end
end
