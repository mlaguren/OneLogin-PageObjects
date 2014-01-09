require 'active_support/core_ext/numeric/time.rb'

  def session_sleep(timeout)
#  Ideally, would love to use this, but need to figure out the string to time interval conversion
#   1.minute executes in 1 second
#    wait = timeout.gsub(/\s+/, ".")
#    sleep(wait.to_i)
    p Time.now
    if timeout == "1 minute"
      sleep(61)
    elsif timeout == "15 minutes"
      sleep(901)
    elsif timeout == "30 minutes"
      sleep(1801)
    elsif timeout == "1 hour"
      sleep(3601)
    elsif timeout == "2 hours"
      sleep(7201)
    elsif timeout == "4 hours"
      sleep(14401)
    elsif timeout == "8 hours"
      sleep(28801) 
    elsif timeout == "1 day"
      sleep(87301)
    else
      sleep(10)
    end
    p Time.now
  end


