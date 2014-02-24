class APIPage
  include Capybara::DSL
  include UserMenu
  include NavigationBar

  def initialize
  end

  def get_api_key
    key = find(:id, "account_api_key").value
    return key
  end

  
end
