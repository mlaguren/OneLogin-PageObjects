  def announce_selenium_cookies(browser)
     p "Current cookies: #{browser.manage.all_cookies.map(&:inspect).join("\n")}"
  end
