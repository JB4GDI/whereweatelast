class LedgersController < ApplicationController

  # This is where the logic for our index page lives
  def index
    @ledgers = Ledger.all
    @place = Place.new
  end

  # Logic for creating new ledgers
  def new
    @ledger = Ledger.new
  end

  def create
    Ledger.create(ledger_params)
    redirect_to root_path
  end

  private

  def ledger_params
    params.require(:ledger).permit(:title)
  end


end
