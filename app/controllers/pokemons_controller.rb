class PokemonsController < ApplicationController
  require 'csv'

  def index
    @pokemons = Pokemon.all
  end

  def upload
    csv_path = File.join Rails.root, 'db', 'pokemons.csv'
    CSV.foreach((csv_path), headers: true) do |p|
      Pokemon.create(id: p[0], name: p[1], height: p[3], weight: p[4])
    end
    redirect_to root_path, notice: 'Pokemons added to the db.'
  end

  def destroy_all
    if Pokemon.count.zero?
      redirect_to root_path, alert: "There aren't any pokemons to be deleted."
    else
      Pokemon.destroy_all
      redirect_to root_path, notice: 'Pokemons Deleted Successfully.'
    end
  end
end
