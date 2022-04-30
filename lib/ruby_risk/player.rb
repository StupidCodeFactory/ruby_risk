require 'securerandom'

module  RubyRisk
  class Player
    include Comparable

    COLORS = %i[red black yellow green grey blue].freeze

    attr_reader :name, :color, :id, :infanteries, :occupied_territories

    def initialize(name:, color:, id: SecureRandom.uuid)
      self.name                 = name
      self.color                = color
      self.id                   = id
      self.infanteries          = []
    end

    def <=>(other)
      id <=> other.id
    end
    def claim(territory)
      return unless units_left?

      territory.transfer(infanteries.pop)
    end

    def units_left?
      infanteries.size.positive?
    end

    def start_turn
      Army.reinforce(self)
    end

    def territories
      Continent.all.flat_map(&:territories).select do |territory|
        territory.occupant == self
      end
    end

    private

    attr_writer :name, :color, :id, :infanteries
  end
end
