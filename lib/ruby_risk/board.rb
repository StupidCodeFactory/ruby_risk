require 'ruby_risk/continent'
require 'ruby_risk/territory'

module RubyRisk
  class Board
    DEFAULT_TERRITORIES_COUNT = 42
    attr_reader :continents

    def initialize(territories_count: DEFAULT_TERRITORIES_COUNT, continents: Continent.all)
      self.continents = continents
    end

    def claimed(territory, player)
      continent = territories.index(territory.continent)
      continent.claim!(player, territory)
    end

    def territories
      continents.map(&:territories)
    end

    private

    attr_writer :continents
  end
end
