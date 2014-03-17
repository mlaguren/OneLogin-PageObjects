class ImportUsersPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
    super
  end

  def upload_csv
    $log.debug("Dir.getwd + '/#{$csvFile}'")
    sleep 2
    page.driver.browser.all(:xpath, ".//*[@class='file-input-wrapper btn']/input")[0].send_keys(Dir.getwd + "/#{$csvFile}")
    click_button('Upload')
  end

end
