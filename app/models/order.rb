class Order < ApplicationRecord
  has_many :transactions, foreign_key: 'order_id', primary_key: 'order_ref'
  validates :order_ref, uniqueness: true
end
