class GroupsPage
  include Capybara::DSL
  include NavigationBar

  def initialize
    super
  end

  def create_new_group
    click_link('New Group')
  end

  def find_group(group)
    find(:xpath,".//td[contains(text(),'#{group}')]")
  end
  
  def verify_group(group)
    find(:xpath, ".//*[@class='js-click-row']//*[@class='span4'][contains(text(),'#{group}')]")
  end

end
