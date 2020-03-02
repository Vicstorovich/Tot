class TestsController < Tot::Controller
  def index
    # render "tests/lists"
    @time = Time.now
    @tests = Test.all
  end

  def create
  end
end
