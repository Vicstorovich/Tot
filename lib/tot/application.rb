require "yaml"
require "singleton"
require "sequel"
require_relative "router"
require_relative "controller"

module Tot
  class Application
    include Singleton

    attr_reader :db

    def initialize
      @router = Router.new
      @db = nil
    end

    def bootstrap!
      require_database
      require_app
      require_routes
    end

    def call(env)
      route = @router.route_for(env)
      controller = route.controller.new(env)
      action = route.action

      make_response(controller, action)
    end

    def routes(&block)
      @router.instance_eval(&block)
    end

    private

    def require_database
      database_config = YAML.load_file(Tot.root.join("config/database.yml"))
      database_config["database"] = Tot.root.join(database_config["database"])
      @db = Sequel.connect(database_config)
    end

    def require_app
      Dir["#{Tot.root}/app/**/*.rb"].each { |file| require file }
    end

    def require_routes
      require Tot.root.join("config/routes")
    end

    def make_response(controller, action)
      controller.make_response(action)
    end
  end
end
