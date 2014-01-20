module SessionTab

  def initialize
    @inactivity = {"selector" => :xpath, "value" => ".//*[@id='policy_session_timeout_minutes_control_group']/div/span/div/a"}

  end

  def is_session_timeout_set_to(time)
    session_value = find(:xpath, @inactivity['value']+"//*[@class='select2-chosen']")
    p session_value.text    
    if session_value.text == time
      p "here"
      return true
    else
      p "false"
      return false
    end 
  end

  def set_session_timeout(timeout)
    find(@inactivity['selector'], @inactivity['value']).click
    find(:xpath, ".//*[@id='select2-drop']/ul/li/div[text()='#{timeout}']").click
  end
end

