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

  def search_by_email(email)
    find(:id, 'name').set email
    find(:id, 'name').native.send_keys(:return)
  end
 
  def returns_one_user(name)
    find(:xpath, ".//*[@class='span4']/h4[contains(text(), name)]")
  end

  
  def select_user(user)
      find(:xpath, ".//*[@class='span4']/h4[contains(text(), '#{user}')]").click
  end

  # find method will return ambigious count if it finds more than 1 user
  def verify_single_user(key)
    begin
      find(:xpath, ".//*[@class='span4']/h4[contains(text(), '#{key}')]")
    rescue
      find(:xpath, ".//*[@class='span4']/a[contains(text(), '#{key}')]")
    end
  end
end
