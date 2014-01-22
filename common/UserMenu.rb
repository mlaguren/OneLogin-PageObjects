module UserMenu 
 def initialize
    @user_nav_menu = {"selector" => :xpath, "values" => ".//*[@class='container user-nav']//*[@class='dropdown']"} 
  end

  def select_revert_to_admin
    find(@user_nav_menu['selector'], @user_nav_menu['values']).hover
    click_link("Revert to admin")
  end

  def log_out
     
  end
end
