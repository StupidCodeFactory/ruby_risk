require 'byebug'
require 'ruby_risk/army'
require 'ruby_risk/dice_rolls/outcomes/claim_initial_territory'
require 'ruby_risk/board'
require 'ruby_risk/players'
require 'ruby_risk/card_deck'

module RubyRisk
  class Game
    MAX_AMOUNT_OF_PAYERS = 6

    INFANTERIES_PER_PLAYER_MAP = {
      2 => 11,
      3 => 35,
      4 => 30,
      5 => 25,
      6 => 20
    }.freeze

    def add_player(attributes)
      if (players.size + 1) > MAX_AMOUNT_OF_PAYERS
        raise ArgumentError, 'You have reached the maximum amount of players.'
      end

      players << Player.new(**attributes)
    end

    def players
      @players ||= Players.new([])
    end

    def unclaimed_territories
      @unclaimed_territories ||= Continent.all.flat_map(&:territories)
    end

    def start
      set_infantery_per_player
    end

    def deal_infanteries
      players.each { |player| infantery_per_player.times { player.infanteries << Infantry.new(player) } }
    end

    def claim(territory, player)
      return false unless player.units_left?

      unclaimed_territories.delete(territory)
      player.claim(territory)
    end

    def countries_card_deck
      @countries_card_deck ||= CardDeck::Countries.new
    end

    def missions_card_deck
      @missions_card_deck ||= CardDeck::Missions.new
    end
    private

    def territories
      @territories ||= territories
    end

    def infantery_per_player
      @infantery_per_player ||= INFANTERIES_PER_PLAYER_MAP[players.size]
    end
    alias set_infantery_per_player infantery_per_player

    def board
      @board ||= Board.new
    end

  end
end
