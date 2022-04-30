module RubyRisk
  class Infantry
    attr_reader :player

    def initialize(player)
      self.player = player
    end

    private
    attr_writer :player
  end
end
