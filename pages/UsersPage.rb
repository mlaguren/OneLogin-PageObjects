class UsersPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
    find(:id, "main-content")
    find(:id, "results")
  end 

  def select_new_user
    click_link("New User")
  end

  def select_user
    @users = all(:xpath, ".//*[@class='js-click-row user']//h4")
    @users[Random.new(@users.length)].click
  end

# select_<submenu>_from_more_actions_menu  where <submenu> is either import_users, bulk_operations, custom_user_fields, approve_all_usersI
# @method select_submenu_from_more_actions_menu

  ["import_users", "bulk_operations", "custom_user_fields", "approve_all_users"].each do |sub_menu|
    define_method("select_#{sub_menu}_from_more_actions_menu") do 
      within(:xpath, ".//*[@class='btn-toolbar pull-right nav']") do
        find(:id, 'more-actions').hover
        click_link("#{sub_menu.gsub!(/_+/, " ").split.each{|i| i.capitalize!}.join(' ')}")
      end
    end
  end
end
