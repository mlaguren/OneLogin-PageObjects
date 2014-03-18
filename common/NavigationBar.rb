# Navigation Bar is a common component across several pages once authenticated in the app.

module NavigationBar

  def initialize
    @container = {"selector" => :xpath, "value" => ".//*[@class='navbar-inner']//*[@class='nav']"}
  end

# select_<menu> where <menu> is either Users, Apps, Activity, or Settings
# @method select_menu
# @scope class

  ["Users", "Apps", "Activity", "Settings"].each do |menu|
    define_method("select_#{menu}") do
      within(@container['selector'], @container['value']) do
        click_link("#{menu}")
      end
    end
  end

# select_from_<menu_name>_menu where <menu_name> is users, apps, activity, or settings
# @method select_from_menuName_menu(submenu)
# @param submenu is the submenu name
# @scope class

  ["users", "apps", "activity", "settings"].each do |menu|
    define_method("select_from_#{menu}_menu") do |submenu|
      within(@container['selector'], @container['value']) do
        begin
          find(:xpath, "//*[@class='#{menu} dropdown']").hover
          click_link("#{submenu}")
          find(:xpath, "//*[@alt='Logo_default@2x']").hover
        rescue
          find(:xpath, "//*[@class='dropdown #{menu.downcase}']").hover
          click_link("#{submenu}")
          find(:xpath, "//*[@alt='Logo_default@2x']").hover
        end
      end
    end
  end

  def go_to_home
    find(:xpath, ".//*[@class='brand']/img").click
  end
        
end

