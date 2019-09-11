class PokemonsController < ApplicationController
  require 'csv'

  def index
    @pokemons = Pokemon.all
  end

  def upload
    csv_path = File.join Rails.root, 'db', 'pokemons.csv'
    PokemonAddJob.perform_later(csv_path)
    redirect_to root_path, notice: 'Pokemons are being added to the db.'
  end

  def destroy_all
    if Pokemon.count.zero?
      redirect_to root_path, alert: "There aren't any pokemons to be deleted."
    else
      PokemonRemoveJob.perform_later
      redirect_to root_path, notice: 'Pokemons are being deleted.'
    end
  end
end
