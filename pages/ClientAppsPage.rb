class ClientAppsPage
  include UserMenu 
  include NavigationBar
  include Capybara::DSL
  
  def initialize
    @tab = {"selector" => :xpath, "value" => ".//*[@class='tab']"}
    @appgroup = {"selector" => :xpath, "value" => ".//*[@class='tab-content appgroup']"} 
    @app = {"selector" => :css, "value" => ".single-portal-app"}
    super
    sleep 2 
    uri = URI.parse(current_url)
    "#{uri.path}".should == "/client/apps"
  end

  def user_is_logged_in
   #Need to handle username 
    find(:xpath, ".//*[@class='dropdown-toggle']").text.should == 'Melvin Laguren'
  end

  def select_any_tab
    find(@tab['selector'], @tab['value']).click
  end
  
  def select_any_app
      sleep 5
      icon = all(@app['selector'], @app['value'])
      if icon.length == 0
        p "No apps configured"
        $log.debug("Unable to select an app because an app is not configured for this account")
      end
      icon.first.click
  end
    
  def edit_app
    find(:xpath, ".//*[@class='edit-apps']").click
    sleep 5
  end  

  def toggle_view
    sleep 1
    begin
      find(:css, "a.portal-icon-view.active").click
      $log.debug("Switching to icon view")
      find(:css, "a.portal-list-view.active")
      state="a.portal-list-view.active"
      p "Switched to icon view i"
    rescue
      find(:css, "a.portal-list-view.active").click
      $log.debug("Switching to list view")
      find(:css, "a.portal-icon-view.active")
      p "Switched to list view"
      state="a.portal-icon-view.active"
    end
    return state
  end
  
  def switch_view_to(view)
    p view
    find(:css, "#{view}").click
  end
end
