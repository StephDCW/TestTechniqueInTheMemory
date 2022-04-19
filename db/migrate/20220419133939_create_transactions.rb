class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :order_id
      t.integer :customer_id
      t.string :country
      t.string :product_code
      t.string :product_description
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
