class AllUsersPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
 
  end

  def search_by_name(name)
    find(:id, 'name').set name
    find(:id, 'name').native.send_keys(:return)
  end
 
  def returns_one_user(name)
    find(:xpath, ".//*[@class='span4']/h4[contains(text(), name)]")
  end

  def search_for_user_in_group(user, group)
    find(:xpath, ".//*[@class='btn btn-primary'][contains(text(),'Filter Users')]").click
    sleep 3
    find(:xpath, ".//*[@class='caret caret-side pull-right']')]").click
  end
end
