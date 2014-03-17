class GroupsPage
  include Capybara::DSL

  def initialize

  end

  def create_new_group
    click_link('New Group')
  end

  def find_group(group)
    find(:xpath,".//td[contains(text(),'#{group}')]")
  end
end
