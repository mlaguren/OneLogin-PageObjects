class APIPage
  include Capybara::DSL
  include UserMenu
  include NavigationBar

  def initialize
  end

  def get_api_key
    key = find(:id, "account_api_key").value
    unless key.nil?
      key = find(:id, "account_api_key").value
    end
    $log.debug("Current API Key:  #{key}")
    return key
  end

  def generate_new_api_key(original_key)
    click_link("Generate new API key")
    key = find(:id, "account_api_key").value
    until key != original_key
      key = find(:id, "account_api_key").value
    end
    $log.debug("New Key: #{key}")
  end  

  def save_api_changes
    find(:css, ".btn.btn-primary").click
  end

end
