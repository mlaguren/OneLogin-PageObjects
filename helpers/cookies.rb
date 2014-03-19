  def announce_selenium_cookies(browser)
    announce "Current cookies: #{browser.manage.all_cookies.map(&:inspect).join("\n")}"
  end
