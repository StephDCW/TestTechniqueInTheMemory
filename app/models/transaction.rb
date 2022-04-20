class Transaction < ApplicationRecord
  belongs_to :order, foreign_key: 'order_id', primary_key: 'order_ref'
  belongs_to :customer, foreign_key: 'customer_id', primary_key: 'customer_ref'
end
