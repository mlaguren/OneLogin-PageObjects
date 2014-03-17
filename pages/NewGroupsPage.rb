class NewGroupsPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
  
  end

  def enter_group_name(name)
    find(:xpath, ".//*[@class='input-medium']").set name
    find(:xpath, ".//*[@class='btn btn-primary editable-submit']").click
    find(:xpath, ".//*[@class='editable editable-click']").text.should == name
  end

  def enter_temporary_group_name
    group = "Temporary"+Time.now.strftime("%Y-%m-%d %H:%M:%S")
    enter_group_name(group)
    click_button('Save')
    find(:id, 'flashnotice').text.should == 'Group was successfully created.'
    $log.debug("#{group} mapping created")
    find(:xpath, ".//*[@class='btn btn-primary']")
    p group
    return group  
  end
end
