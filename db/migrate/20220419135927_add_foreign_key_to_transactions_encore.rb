class AddForeignKeyToTransactionsEncore < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :transactions, :customers, column: :customer_id, primary_key: :customer_ref
    remove_index :customers, :customer_ref
    add_index :customers, :customer_ref
  end
end
