require 'forwardable'

module RubyRisk
  class Players
    extend Forwardable
    def_delegator :@players, :each
    def_delegator :@players, :size
    def_delegator :@players, :<<

    def initialize(players)
      self.players = players
      first_player
      reset_turns!
    end

    def first_player
      @first_player ||= players[rand(players.size - 1)]
    end

    def next_player
      player = players.first
      players.rotate!
      player
    end

    def reset_turns!
      players.rotate! until players.first == first_player
    end

    private

    attr_accessor :players
  end
end
