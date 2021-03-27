require 'ruby_risk/continent'
require 'ruby_risk/territory'

module RubyRisk
  class Board
    DEFAULT_TERRITORIES_COUNT = 42
    attr_reader :territories

    def initialize(territories_count: DEFAULT_TERRITORIES_COUNT)
      self.territories = [
        Continent.new(name: :north_america,   territories: 9.times.map { |i| Territory.new(name: i, id: i) }),
        Continent.new(name: :south_america,   territories: 4.times.map { |i| Territory.new(name: i, id: i) }),
        Continent.new(name: :afric,           territories: 6.times.map { |i| Territory.new(name: i, id: i) }),
        Continent.new(name: :europe,          territories: 7.times.map { |i| Territory.new(name: i, id: i) }),
        Continent.new(name: :eurasia,         territories: 12.times.map { |i| Territory.new(name: i, id: i) }),
        Continent.new(name: :south_east_asia, territories: 4.times { |i| Territory.new(name: i, id: i) })
      ]
    end

    def claimed(territory, player)
      continent = territories.index(territory.continent)
      continent.claim!(player, territory)
    end

    private

    attr_writer :territories
  end
end
