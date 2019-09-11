class PokemonRemoveJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Pokemon.destroy_all
  end
end
