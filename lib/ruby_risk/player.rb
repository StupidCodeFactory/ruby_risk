require 'securerandom'

module  RubyRisk
  class Player
    COLORS = %i[red black yellow green grey blue].freeze
    DEFAULT_TERRITORY_SELECTOR =
      ->(unclaimed_territories) { unclaimed_territories[rand(unclaimed_territories.size - 1)] }

    attr_reader :name, :color, :id, :infanteries, :territory_selector, :occupied_territories

    def initialize(name:, color:, territory_selector: DEFAULT_TERRITORY_SELECTOR)
      self.name                 = name
      self.color                = color
      self.id                   = SecureRandom.uuid
      self.infanteries          = []
      self.territory_selector   = territory_selector
      self.occupied_territories = []
    end

    def claim(unclaimed_territories)
      return false unless units_left?

      infantery = infanteries.pop

      territory = territory_selector.call(unclaimed_territories)
      [infantery, territory]
    end

    def units_left?
      infanteries.size.positive?
    end
    private

    attr_writer :name, :color, :id, :infanteries, :territory_selector, :occupied_territories
  end
end
