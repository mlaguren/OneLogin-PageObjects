class UsersPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize

  end

  def select_new_user
    click_link("New User")
  end

# select_<submenu>_from_more_actions_menu  where <submenu> is either Import Users, Bulk Operations, Custom User Fields, Approval All Users
# @method select_<submenu>_from_more_actions_menu

  ["import_users", "bulk_operations", "custom_user_fields", "approve_all_users"].each do |sub_menu|
    define_method("select_#{sub_menu}_from_more_actions_menu") do 
      within(:xpath, ".//*[@class='btn-toolbar pull-right nav']") do
        find(:id, 'more-actions').hover
        click_link("#{sub_menu.gsub!(/_+/, " ").split.each{|i| i.capitalize!}.join(' ')}")
      end
    end
  end
end

