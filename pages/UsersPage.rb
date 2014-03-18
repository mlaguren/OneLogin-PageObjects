class UsersPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
    find(:id, "main-content")
    find(:xpath, ".//*[@id='main-content']/div")
    sleep 5
    find(:id, "results")
    super
  end 

  def select_new_user
    click_link("New User")
  end

  def select_user_to_assume
    users = all(:xpath, ".//*[@class='js-click-row user']//h4")
    userlist=[]
    admin =  $SETUP['admin']['full']
    users.each do |user|
      if user.text != admin
        userlist.push("#{user.text}")
      end
    end
    
    # Sometimes in staging, we are getting duplicate users.  Check for it then call failure here.

    userlist.uniq.length.should == userlist.length
    selected_user=userlist.sample 
    $log.debug("Assuming #{selected_user}")
    find(:xpath, ".//h4[contains(text(),'#{selected_user}')]").click
    return selected_user
  end

  def member_of_group(group_name)
    find(:xpath, ".//*[@id='s2id_user_group_id']//*[@class='select2-chosen'][contains(text(), 'Import Group')]")
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
