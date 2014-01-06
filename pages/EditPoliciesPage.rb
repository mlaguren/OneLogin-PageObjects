class EditPoliciesPage
  include Capybara::DSL
  include UserMenu
  include NavigationBar
  include SessionTab
  def initialize
    @tab_section = {"selector" => :xpath, "value" => ".//*[@class='nav nav-tabs thin with-tabs']"}
    super
  end

  def click_on(tab)
    find(:xpath, ".//*[@id='tabs']/li/a/span[contains(.,'#{tab}')]").click
  end

end
