require "singleton"

module Tot
  class Application
    include Singleton

    def call(env)
      [
        200,
        { "Content-Type" => "text/plain" },
        ["Plain framework in action!\n"],
      ]
    end
  end
end
