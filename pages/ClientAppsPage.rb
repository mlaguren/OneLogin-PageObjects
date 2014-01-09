class ClientAppsPage
  include UserMenu 
  include NavigationBar
  include Capybara::DSL
  
  def initialize
    @tab = {"selector" => :xpath, "value" => ".//*[@class='tab']"}
    @appgroup = {"selector" => :xpath, "value" => ".//*[@class='tab-content appgroup']"} 
    @app = {"selector" => :xpath, "value" => ".//*[@class='appicon']"}
    super
  end

  def select_any_tab
    find(@tab['selector'], @tab['value']).click
  end
  
  def select_any_app
    begin
      icon = find(@app['selector'], @app['value']).sample
      p icon[:alt]
      icon.click
    rescue
      select_any_tab
      find(@app['selector'], @tab['value']).click
    end
  end
    
  
end
