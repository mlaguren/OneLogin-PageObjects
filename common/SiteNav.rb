module SiteNav

  def initialize
    @home = {"selector" => :id, "values" => "logo"}
    @main_menu = {"selector" => :id, "values" => "menu-main-nav"}
  end

  def go_to_sign_up
    find(:id, "nav-signup").click
  end

end

