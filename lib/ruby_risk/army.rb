require 'ruby_risk/armies/artillery'
require 'ruby_risk/armies/cavalry'
require 'ruby_risk/armies/infantry'

module RubyRisk
  class Army
    class << self
      def reinforce(user)
        reinforcement_size = reinforce_from_territories(user) + reinforce_from_continents(user)
        reinforcement_size.times { user.infanteries << Infantry.new(user) }
      end

      def reinforce_from_territories(user)
        if user.territories.size <= 11 then 3
        elsif user.territories.size <= 14 then 4
        elsif user.territories.size <= 17 then 5
        end
      end

      def reinforce_from_continents(user)
        continents = user.territories.map(&:continent)
                       .uniq
                       .select { |continent| continent.occupied_by?(user) }

        return 0 unless continents.any?

        continents.map(&:reinforcement).inject(&:+)
      end
    end
    private_class_method :reinforce_from_territories
    private_class_method :reinforce_from_continents
  end
end
