module SessionTab

  def initialize
    @inactivity = {"selector" => :id, "value" => "s2id_policy_session_timeout_minutes"}

  end

  def set_session_timeout(timeout)
    find(@inactivity['selector'], @inactivity['value']).click 
  end
end

