class PoliciesPage
  include Capybara::DSL
  include UserMenu
  include NavigationBar

  def initialize
    @policy_table = {"selector" => :xpath, "value" => ".//*[@class='table table-hover with-border-top']/tbody"}
    super
  end

  def click_policy_by_name (name)
    within(@policy_table['selector'], @policy_table['value']) do
      policy_name = "//div[@id='main-content']//td[normalize-space(.)='#{name}']"
      find(:xpath, policy_name).click
    end
  end
end
