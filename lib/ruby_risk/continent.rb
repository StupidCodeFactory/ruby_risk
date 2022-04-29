module RubyRisk
  class Continent
    attr_reader :territories, :name

    class << self
      def north_america
        @north_america ||= new(name: :north_america, territories: 9.times.map { |i| Territory.new(name: i, id: i) })
      end

      def south_america
        @south_america ||= new(name: :south_america, territories: 4.times.map { |i| Territory.new(name: i, id: i) })
      end

      def africa
        @africa ||= new(name: :africa, territories: 6.times.map { |i| Territory.new(name: i, id: i) })
      end

      def europe
        @europe ||= new(name: :europe, territories: 7.times.map { |i| Territory.new(name: i, id: i) })
      end

      def eurasia
        @eurasia ||= new(name: :eurasia, territories: 12.times.map { |i| Territory.new(name: i, id: i) })
      end

      def south_east_asia
        @south_east_asia ||= new(name: :south_east_asia, territories: 4.times { |i| Territory.new(name: i, id: i) })
      end

      def all
        @all = [north_america, south_america, africa, europe, eurasia, south_east_asia]
      end
    end

    def initialize(name:, territories:)
      self.name = name
      self.territories = territories
    end

    private

    attr_writer :territories, :name
  end
end
