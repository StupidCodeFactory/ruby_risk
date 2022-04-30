module RubyRisk
  class CardDeck
    module Cards
      class CountryCard
        attr_reader :territory, :army

        def initialize(territory, army)
          self.territory = territory
          self.army      = army
        end

        private

        attr_writer :territory, :army
      end
    end
  end
end
