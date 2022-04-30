require 'ruby_risk/territory'

module RubyRisk
  class Continent
    attr_reader :territories, :name

    class << self
      def north_america
        @north_america ||= new(name: :north_america, reinforcements: 5, territories: 9.times.map { |i| Territory.new(name: i) })
      end

      def south_america
        @south_america ||= new(name: :south_america, reinforcements: 2, territories: 4.times.map { |i| Territory.new(name: i) })
      end

      def africa
        @africa ||= new(name: :africa, reinforcements: 3, territories: 6.times.map { |i| Territory.new(name: i) })
      end

      def europe
        @europe ||= new(name: :europe, reinforcements: 5, territories: 7.times.map { |i| Territory.new(name: i) })
      end

      def eurasia
        @eurasia ||= new(name: :eurasia, reinforcements: 7, territories: 12.times.map { |i| Territory.new(name: i) })
      end

      def south_east_asia
        @south_east_asia ||= new(name: :south_east_asia, reinforcements: 2, territories: 4.times.map { |i| Territory.new(name: i) })
      end

      def all
        @all ||= [north_america, south_america, africa, europe, eurasia, south_east_asia]
      end
    end

    def initialize(name:, territories:, reinforcements:)
      self.name           = name
      self.territories    = territories
      self.reinforcements = reinforcements
    end

    def occupied_by?(user)
      territories.map(&:occupant).all?(user)
    end

    private

    attr_writer :territories, :name, :reinforcements

    all
  end
end
