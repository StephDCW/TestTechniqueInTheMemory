class TransactionsController < ApplicationController

  def index
    # if params[:transaction] && params[:transaction][":country"]
      # @transactions = Transaction.all.search(params[:search])
      # @transactions = Transaction.all.search(params[:transaction][":country"][","])
    if params["q"]
      @transactions = Transaction.where(country: params["q"])
      @total_sum = @transactions.sum("unit_price * quantity")
      @uniq_orders = @transactions.distinct.pluck(:order_id).count
      @average_per_order = @total_sum / @uniq_orders
      @uniq_customers = @transactions.distinct.pluck(:customer_id).count
    else
      @transactions = Transaction.all
      @total_sum = @transactions.sum("unit_price * quantity")
      @uniq_orders = Transaction.distinct.pluck(:order_id).count
      @average_per_order = @total_sum / @uniq_orders
      @uniq_customers = @transactions.distinct.pluck(:customer_id).count
    end
  end
end