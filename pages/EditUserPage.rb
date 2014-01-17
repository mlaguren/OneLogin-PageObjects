class EditUserPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

# @todo

  ["change_password", "send_invitation", "show_user_details", "delete", "pki_certificate", "create_new_user"].each do |menu|
    define_method("select_#{menu}_from_more_actions_menu") do 
      within(:xpath, "//*[@class='btn-toolbar pull-right nav']") do
        find(:id, "more-actions").hover
      end
    end
  end

end
