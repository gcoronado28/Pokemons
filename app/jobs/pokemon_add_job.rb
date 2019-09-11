class PokemonAddJob < ApplicationJob
  require 'csv'
  queue_as :default

  def perform(csv_path)
    CSV.foreach(csv_path, headers: true) do |p|
      Pokemon.create(id: p[0], name: p[1], height: p[3], weight: p[4])
    end
  end
end
