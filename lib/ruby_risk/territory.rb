module RubyRisk
  class Territory
    attr_reader :id, :name, :occupier, :infanteries

    def initialize(id: SecureRandom.uuid, name: "")
      self.id = id
      self.name = name
    end

    def transfer(armies)
      self.armies += Array(armies)
    end

    def occupant
      armies.first.player
    end

    private

    attr_writer :id, :name, :armies

    def armies
      @armies ||= []
    end
  end
end
