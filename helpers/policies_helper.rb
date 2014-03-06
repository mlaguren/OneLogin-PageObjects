require 'active_support/core_ext/numeric/time.rb'

  def session_sleep(timeout)
#  Ideally, would love to use this, but need to figure out the string to time interval conversion
#   1.minute executes in 1 second
#    wait = timeout.gsub(/\s+/, ".")
#    sleep(wait.to_i)
    $log.debug("Starting the wait now:  #{Time.now}")
    if timeout == "1 minute"
      $log.debug("Waiting for 1 minute and 1 second")
      sleep(61)
    elsif timeout == "15 minutes"
      $log.debug("Waiting for 15 minutes and 1 second")
      sleep(901)
    elsif timeout == "30 minutes"
      $log.debug("Waiting for 30 minutes and 1 second")
      sleep(1801)
    elsif timeout == "1 hour"
      $log.debug("Waiting for 1 hour and 1 second")
      sleep(3601)
    elsif timeout == "2 hours"
      $log.debug("Waiting for 2 hours and 1 second")
      sleep(7201)
    elsif timeout == "4 hours"
      $log.debug("Waiting for 4 hours  and 1 second")
      sleep(14401)
    elsif timeout == "8 hours"
      $log.debug("Waiting for 8 hours and 1 second")
      sleep(28801) 
    elsif timeout == "1 day"
      $log.debug("Waiting for 1 day and 1 second")
      sleep(87301)
    else
      $log.debug("Invalid choice, failing the scenario")
      exit 1
    end
    $log.debug("Time is up: #{Time.now}")
  end


