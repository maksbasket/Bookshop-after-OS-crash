class ChangePayTypesTypeInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :pay_type, :integer
  end
end
