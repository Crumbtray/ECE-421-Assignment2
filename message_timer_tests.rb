require 'test/unit'
require './message_timer'

class TimerTests < Test::Unit::TestCase
  def test_max_value
    MessageTimer.timedMessage("999ms", "testMessage")
  end
  
  def test_over_max_value
    MessageTimer.timedMessage("1000ms", "testMessage")
  end
  
  def test_under_min_value
    MessageTimer.timedMessage("-1s", "testMessage")
  end
  
  def test_incorrect_characters
	MessageTimer.timedMessage("xns", "testMessage")
  end
  
  def test_all_resolutions
    MessageTimer.timedMessage("1h1m1s1ms1ns", "testMessage")
  end
  
end