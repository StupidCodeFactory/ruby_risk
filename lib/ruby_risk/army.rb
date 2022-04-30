byebug
module RubyRisk
  class Army
    def self.reinforce(user)
      reinforce_from_territories(user)
      reinforce_from_continents(user)
    end

    private

    def reinforce_from_territories(user)
      reinforcement_size = if user.territories.size <= 11 then 3
                           elsif user.territories.size <= 14 then 4
                           elsif user.territories.size <= 17 then 5
                           end

      reinforcement_size.times { user.infanteries << Infantry.new(user) }
    end
  end
end

require 'ruby_risk/army/artillery'
require 'ruby_risk/army/cavalry'
require 'ruby_risk/army/infantry'
