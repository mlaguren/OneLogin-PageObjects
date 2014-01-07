module SessionTab

  def initialize
    @inactivity = {"selector" => :xpath, "value" => ".//*[@id='policy_session_timeout_minutes_control_group']/div/span/div/a"}

  end

  def set_session_timeout(timeout)
    find(@inactivity['selector'], @inactivity['value']).click
    find(:xpath, ".//*[@id='select2-drop']/ul/li/div[text()='#{timeout}']").click
  end
end

