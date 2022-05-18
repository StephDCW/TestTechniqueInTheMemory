class TransactionsController < ApplicationController

  def index
    if params["q"] && params["q"] != "All"
      @transactions = Transaction.where(country: params["q"])
    else
      @transactions = Transaction.all
    end
  end
end
