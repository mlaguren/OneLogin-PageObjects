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

  def generate_new_api_key(original_key)
    click_link("Generate new API key")
    key = find(:id, "account_api_key").value
    until key == original_key
      key = find(:id, "account_api_key").value
    end
    p key
  end  

  def save_api_changes
    click_button("Save")
    find(:id, "flashes")
    find(:xpath, ".//*[@class='btn btn-primary disabled']")
  end
end
