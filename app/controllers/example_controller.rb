class ExampleController < ApplicationController
  def test
  	@current_time = Time.now
  	#hash = ["key" => "value"]
  	@array = ["key" => "value"]
  end
end
