require 'ruby_risk/army/artillery'
require 'ruby_risk/army/cavalry'
require 'ruby_risk/army/infantry'
require 'ruby_risk/dice_rolls/outcomes/claim_initial_territory'
require 'ruby_risk/board'

module RubyRisk
  class Game
    MAX_AMOUNT_OF_PAYERS = 6
    attr_reader :players, :board

    INFANTERIES_PER_PLAYER_MAP = {
      2 => 11,
      3 => 35,
      4 => 30,
      5 => 25,
      6 => 20
    }.freeze

    def initialize
      self.players = []
      self.first_player_index = -1
      self.territories = []
      self.board = Board.new
    end

    def add_player(attributes)
      if (players.size + 1) > MAX_AMOUNT_OF_PAYERS
        raise ArgumentError, 'You have reached the maximum amount of players.'
      end

      players << Player.new(**attributes)
    end

    def roll_dice(player_outcome)
      first_player = players[rand(players.size - 1)]

      loop do
        break if players[0] == first_player

        players.rotate!
      end

      player_outcome.player = players[first_player_index]

      player_outcome
    end

    def start
      infantery_per_player
    end

    def deal_infanteries
      players.each do |player|
        infantery_per_player.times { player.infanteries << Infantry.new }
      end
    end

    def claims_territories
      unclaimed_territories = board.territories.dup

      player_index = 0
      loop do
        byebug
        player = players[player_index]

        unless player.units_left?
          player_index += 1
          next
        end

        break unless player.claim(unclaimed_territories)

      end

      Thread.new { sleep 1 }
    end

    private

    attr_writer :players, :territories, :board
    attr_accessor :first_player_index

    def territories
      @territories ||= territories
    end

    def infantery_per_player
      @infantery_per_player ||= INFANTERIES_PER_PLAYER_MAP[players.size]
    end
  end
end
