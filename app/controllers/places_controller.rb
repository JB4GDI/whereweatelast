class PlacesController < ApplicationController
  before_action :authenticate_user!

  def create

    # The place will always have a ledger as a parent.  Find it.
    @ledger = Ledger.find(params[:ledger_id])

    # Initialize a place
    #TODO: Do we have to merge this to a user?
    @ledger.places.create(place_params)

    # Bring us right back to the parent ledger when done
    redirect_to ledger_path(@ledger)
  end

  private

  def place_params
    params.require(:place).permit(:name, :last_visited, :minutes_away)
  end

end
