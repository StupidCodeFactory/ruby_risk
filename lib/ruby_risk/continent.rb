module RubyRisk
  class Continent
    attr_reader :territories, :name
    def initialize(name:, territories:)
      self.name = name
      self.territories = territories
    end

    private

    attr_writer :territories, :name
  end
end
