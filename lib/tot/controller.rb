module Tot
  class Controller
    def initialize(env)
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
      @env_hash = env.inspect
    end

    def make_response(action)
      [
        200,
        {
          "Content-Type" => "text/plain",
          "X-Tot-Controller" => self.class.name,
          "X-Tot-Action" => action,
        },
        ["Plain framework in action!\n", @env_hash],
      ]
    end
  end
end
