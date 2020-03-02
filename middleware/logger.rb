require "logger"

class TotLogger
  def initialize(app, **options)
    @logger = Logger.new(options[:logdev] || STDOUT)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    log = build_log(env, status, headers)
    @logger.info(log)
    [status, headers, response]
  end

  private

  def build_log(env, status, headers)
    "Request: #{env["REQUEST_METHOD"]} #{env["REQUEST_URI"]}\n" \
    "Handler: #{env["tot.controller"].class}##{env["tot.action"]}\n" \
    "Response: #{status} #{env["tot.content-type"]} #{env["tot.render_view"]}\n"
  end
end
