module RubyRisk
  class CardDeck

    def cards
      @cards ||= []
    end

    private

    attr_writer :cards
  end
end

require 'ruby_risk/card_decks/countries'
require 'ruby_risk/card_decks/missions'
