class ClientAppsPage
  include UserMenu 
  include NavigationBar
  include Capybara::DSL
  
  def initialize
    @tab = {"selector" => :xpath, "value" => ".//*[@class='tab']"}
    @appgroup = {"selector" => :xpath, "value" => ".//*[@class='tab-content appgroup']"} 
    @app = {"selector" => :css, "value" => "img.appicon"}
    super
  end

  def select_any_tab
    find(@tab['selector'], @tab['value']).click
  end
  
  def select_any_app
      icon = all(@app['selector'], @app['value'])
      icon.first.click
  end
    
  
end
