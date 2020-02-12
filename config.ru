require_relative "config/environment"
require_relative "middleware/logger"

use TotLogger, logdev: Tot.root.join("log/simpler.log")
run Tot.application
