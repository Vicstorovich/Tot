require "erb"

module Tot
  class View
    VIEW_BASE_PATH = "app/views".freeze

    def initialize(env)
      @env = env
    end

    def render(binding)
      template = File.read(template_path)

      ERB.new(template).result(binding)
    end

    private

    def controller
      @env["tot.controller"]
    end

    def action
      @env["tot.action"]
    end

    def template
      @env["tot.template"]
    end

    def template_path
      path = template || [controller.name, action].join("/")

      Tot.root.join(VIEW_BASE_PATH, "#{path}.html.erb")
    end
  end
end
