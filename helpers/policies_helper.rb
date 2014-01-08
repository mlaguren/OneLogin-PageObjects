require 'active_support/core_ext/numeric/time.rb'

  def sleep_session(timeout)
    wait = timeout.gsub(/\s+/, ".")
    sleep(wait.to_i)
  end


