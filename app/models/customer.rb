class Customer < ApplicationRecord
  has_many :transactions, foreign_key: 'customer_id', primary_key: 'customer_ref'
  validates :customer_ref, uniqueness: true
end
