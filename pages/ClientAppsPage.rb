class ClientAppsPage
  include UserMenu 
  include NavigationBar
  include Capybara::DSL
  
  def initialize
    @my_apps_tab = {"selector" => :id, "value"=>"tab_0"}
    @sub_menu = {"selector" => :xpath, "value" => ".//*[@class='submenu']/ul/li/a"}
    super
  end

  def portal_tabs_are_enabled?
    if page.has_link?('My apps') then
      return false
    else
      return true
    end
    
  end

  def select_company_tab
    tabs = page.all(@sub_menu['selector'], @sub_menu['value'])
    tabs.each do |tab|
      if tab.text != "Personal" then
        find_link(tab.text).click
        break
      end
    end
  end

  def open_an_app
    #test=find(:xpath, './/*[@style="display: inline;"]/div/a')
    #p test
    #test.click
    find(:xpath, './/*[@class="app"]/img').click
  end
 
  def open_company_app
    if portal_tabs_are_enabled? then
      select_company_tab
      #open_app_from_tab(:company=>true, portal=>true
    else
      #open_company_app
    end
    open_an_app
    sleep 10
  end
  
  def launch_personal_app
  end
  
  def launch_app (app_name)
  end
  
  def click_tab
  end
  
end
