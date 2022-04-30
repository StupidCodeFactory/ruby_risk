module RubyRisk
  class CardDeck
    module Cards
      class Mission
        def initialize(mission_id)
          self.mission_id = mission_id
        end

        def mission
          I18n.t(mission_id, scope: :missions)
        end

        def alternate_mission
          return unless mission_id.match(/destroy/)

          I18n.t(:alternate_mission, scope: :missions)
        end

        private

        attr_accessor :mission_id
      end
    end
  end
end
