class UsersPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize

  end

  def select_new_user
    click_link("New User")
  end

end

