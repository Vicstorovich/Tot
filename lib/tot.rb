require "pathname"
require_relative "tot/application"

module Tot
  class << self
    def application
      Application.instance
    end

    def root
      Pathname.new(File.expand_path("..", __dir__))
    end
  end
end
