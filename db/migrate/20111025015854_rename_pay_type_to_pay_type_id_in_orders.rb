class RenamePayTypeToPayTypeIdInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :pay_type, :pay_type_id
  end
end
