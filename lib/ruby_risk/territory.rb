module RubyRisk
  class Territory
    attr_reader :id, :name

    def initialize(id:, name: "")
      self.id = id
      self.name = name
    end

    private
    attr_writer :id, :name
  end
end
