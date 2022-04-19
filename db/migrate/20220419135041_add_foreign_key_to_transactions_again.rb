class AddForeignKeyToTransactionsAgain < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :customer_ref
    add_column :customers, :customer_ref, :integer
    add_index :customers, :customer_ref, unique: true
    add_foreign_key :transactions, :customers, column: :customer_id, primary_key: :customer_ref

  end
end
