require 'ruby_risk/card_decks/cards/country_card'
require 'ruby_risk/card_decks/cards/wild_card'

module RubyRisk
  class CardDeck
    class Countries < CardDeck

      ARMY_TYPES = [RubyRisk::Infantry, RubyRisk::Cavalry, RubyRisk::Artillery].freeze

      def initialize
        territories = Continent.all.flat_map(&:territories)
        [(0..13), (14..27), (28..41)].each do |range|
          self.cards += generate_country_cards_for(territories.slice(range))
        end
        cards << Cards::WildCard.new << Cards::WildCard.new
      end

      private

      def generate_country_cards_for(territories)
        territories.slice(0..13).zip(armies).map { |territory, army| Cards::CountryCard.new(territory, army) }
      end

      def armies
        (4.times.map { ARMY_TYPES } << ARMY_TYPES[0..1]).inject(:+).shuffle
      end
    end
  end
end
