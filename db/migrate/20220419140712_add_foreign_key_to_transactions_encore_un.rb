class AddForeignKeyToTransactionsEncoreUn < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :transactions, :orders, column: :order_id, primary_key: :order_ref
    remove_index :orders, :order_ref
  end
end
