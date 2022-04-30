require 'securerandom'

module  RubyRisk
  class Player
    COLORS = %i[red black yellow green grey blue].freeze

    attr_reader :name, :color, :id, :infanteries, :occupied_territories

    def initialize(name:, color:, id: SecureRandom.uuid)
      self.name                 = name
      self.color                = color
      self.id                   = id
      self.infanteries          = []
      self.occupied_territories = []
    end

    def claim(territory)
      infantery = infanteries.pop
      territory.occupier = self
      territory.infanteries << infantery
      occupied_territories << territory
    end

    def units_left?
      infanteries.size.positive?
    end

    private

    attr_writer :name, :color, :id, :infanteries, :territory_selector, :occupied_territories
  end
end
