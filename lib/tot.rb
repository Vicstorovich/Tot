require_relative "tot/application"

module Tot
  class << self
    def application
      Application.instance
    end
  end
end
