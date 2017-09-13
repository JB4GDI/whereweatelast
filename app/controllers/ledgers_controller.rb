class LedgersController < ApplicationController

  # You need to be a logged in user to access new/create
  before_action :authenticate_user!, only: [:new, :create]

  # This is where the logic for our index page lives
  def index

    # Build the ledgers if the user is logged in.  Otherwise, initialize a dummy one.
    if current_user
      @ledgers = current_user.ledgers.all
    else
      @ledgers = Ledger.new
    end
    
    @place = Place.new
  end

  def new
    @ledger = Ledger.new
  end

  def create
    # We want to make sure a ledger is tied to the user who just created it
    current_user.ledgers.create(ledger_params)
    redirect_to root_path
  end

  def show
    @ledger = Ledger.find(params[:id])
  end

  def destroy
    @ledger = Ledger.find(params[:id])
    @ledger.destroy
    redirect_to root_path
  end

  private

  def ledger_params
    params.require(:ledger).permit(:title)
  end


end
