class PlacesController < ApplicationController
  before_action :authenticate_user!

  def create

    # The place will always have a ledger as a parent.  Find it.
    @ledger = Ledger.find(params[:ledger_id])

    # Initialize a place
    #TODO: Do we have to merge this to a user?
    @ledger.places.create(place_params)

    # Bring us right back to the main list
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  # If we just ate here, we simply want to update this record in the database to have today's date
  def justatehere

    @place = Place.find(params[:id])

    @place.update_attribute(:last_visited, Date.today)

    # Bring us right back to the main list
    redirect_to root_path

  end

  private

  def place_params
    params.require(:place).permit(:name, :last_visited, :minutes_away)
  end

end
