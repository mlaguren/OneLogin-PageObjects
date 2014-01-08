module NavigationBar

  def initialize
    @container = {"selector" => :xpath, "value" => ".//*[@class='navbar-inner']"}
  end

  ["Users", "Apps", "Activity", "Settings"].each do |menu|
    define_method("select_#{menu}") do
      within(@container['selector'], @container['value']) do
        click_link("#{menu}")
      end
    end
  end

  ["Users", "Apps", "Activity", "Settings"].each do |menu|
    define_method("select_from_#{menu}_menu") do |submenu|
      within(@container['selector'], @container['value']) do
        begin
          find(:xpath, "//*[@class='#{menu.downcase} dropdown']").hover
          click_link("#{submenu}")
        rescue
          find(:xpath, "//*[@class='dropdown #{menu.downcase}']").hover
          click_link("#{submenu}")
        end
      end
    end
  end

  def go_to_home
    find(:id, "main_logo").click
  end
        
end

