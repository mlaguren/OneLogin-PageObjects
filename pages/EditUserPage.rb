class EditUserPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize

  end

# select_<submenu>_from_more_actions_menu  where <submenu> is either change_password, send_invitation, show_user_details, delete, or create_new_user
# @method select_submenu_from_more_actions_menu

  ["change_password", "send_invitation", "show_user_details", "delete", "create_new_user].each do |sub_menu|
    define_method("select_#{sub_menu}_from_more_actions_menu") do
      within(:xpath, ".//*[@class='btn-toolbar pull-right nav']") do
        find(:id, 'more-actions').hover
        click_link("#{sub_menu.gsub!(/_+/, " ").split.each{|i| i.capitalize!}.join(' ')}")
      end
    end
  end

  def select_pki_certificate_from_more_actions_menu
    within(:xpath, ".//*[@class='btn-toolbar pull-right nav']") do
      find(:id, 'more-actions').hover
      click_link(:xpath, ".//*[@class='no-ajaxy']")
    end
  end

end
