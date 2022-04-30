require 'ruby_risk/card_decks/cards/mission'

module RubyRisk
  class CardDeck
    class Missions < CardDeck
      def initialize
        %i[
        destroy_green
        destroy_red
        destroy_blue
        destroy_black
        destroy_yellow
        destroy_pink
        24_countries
        conquer_18
        asia_and_south_america
        asia_and_africa
        north_america_and_africa
        north_america_and_australia
        europe_and_south_america
        europe_and_australia
      ].each do |mission|
          cards << Cards::Mission.new(mission)
        end
      end
    end
  end
end
