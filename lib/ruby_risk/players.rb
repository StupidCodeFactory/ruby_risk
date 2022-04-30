require 'forwardable'

module RubyRisk
  class Players
    extend Forwardable
    def_delegator :@players, :each
    def_delegator :@players, :size
    def_delegator :@players, :<<

    def initialize(players)
      self.players = players
    end

    def first_player
      @first_player ||= players[rand(players.size - 1)].tap do |player|
        players.rotate! until players.first == player
      end
    end

    private
    attr_accessor :players
  end
end
