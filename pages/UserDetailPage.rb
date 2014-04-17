class UserDetailPage 
  include Capybara::DSL
  include NavigationBar

  def initialize
  end

  # @deprecated
  def assume_user(username)
    click_link 'Assume User'
    #find(:xpath, ".//*[@class='dropdown-toggle']").text.should == username
    find('.dropdown-toggle', :text => "#{username}")
  end

  def group_member_of(group)
    find(:xpath,".//*[@id='s2id_user_group_id']")
  end
end
