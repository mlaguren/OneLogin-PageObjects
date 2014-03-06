class ClientAppsPage
  include UserMenu 
  include NavigationBar
  include Capybara::DSL
  
  def initialize
    @tab = {"selector" => :xpath, "value" => ".//*[@class='tab']"}
    @appgroup = {"selector" => :xpath, "value" => ".//*[@class='tab-content appgroup']"} 
    @app = {"selector" => :css, "value" => ".single-portal-app"}
    super
    sleep 5 
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
    
  
end
