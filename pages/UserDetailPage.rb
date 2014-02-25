class UserDetailPage 
  include Capybara::DSL
  include NavigationBar

  def initialize
  end

  def assume_user(username)
    click_link 'Assume User'
    #find(:xpath, ".//*[@class='dropdown-toggle']").text.should == username
    find('.dropdown-toggle', :text => "#{username}")
  end

end
