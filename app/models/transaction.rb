class Transaction < ApplicationRecord
  belongs_to :order, foreign_key: 'order_id', primary_key: 'order_ref'
  belongs_to :customer, foreign_key: 'customer_id', primary_key: 'customer_ref'

  def self.total_sum
    self.sum("unit_price * quantity")
  end

  def self.average_per_order
    uniq_order = Transaction.distinct(:order_id).count
    total_calc = Transaction.total_sum
    return (total_calc / uniq_order)
  end

  def self.uniq_customers
    self.distinct(:customer_id).count
  end

  def self.all_countries
    Transaction.pluck(:country).uniq
  end
end
