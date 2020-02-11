require_relative "tot/application"

module Tot
  def self.application
    Application.instance
  end
end
