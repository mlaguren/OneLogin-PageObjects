module UserMenu 
 def initialize
    @user_nav_menu = {"selector" => :xpath, "values" => ".//*[@class='container user-nav']//*[@class='dropdown-toggle']"} 
  end

  def select_revert_to_admin(user)
    $log.debug("Reverting back to #{user}")
    find('.dropdown-toggle', :text => "#{user}").hover
    click_link("Revert to admin")
  end

  def log_out
     
  end
end
