class AddForeignKeyToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_index :orders, :order_ref, unique: true
    add_foreign_key :transactions, :orders, column: :order_id, primary_key: :order_ref

  end
end
