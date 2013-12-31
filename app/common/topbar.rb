module Topbar
  def initialize
    @logo = {"selector" => :id, "value"=>"logo"}
    @logout = {"selector" => :xpath, "value" => ".//*[@id='current_user']/a"}
    @sub_menu = {"selector" => :xpath, "value" => ".//*[@class='submenu']/ul/li/a"}
  end

  def logout
    find(@logout['selector'], @logout['value']).click
  end

end
