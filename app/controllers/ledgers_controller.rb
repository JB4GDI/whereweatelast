class LedgersController < ApplicationController

  # This is where the logic for our index page lives
  def index
    @ledgers = Ledger.all
  end

end
