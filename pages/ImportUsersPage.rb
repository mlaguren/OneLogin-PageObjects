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

  def failed_to_upload_message
    find(:id, ".//*[@id='flasherror']//*[@class='container']").text.should == 'Could not import file'
  end

  def display_reason
    find(:xpath, ".//*[@id='main-content']/form/div[3]/p/strong").text.should == 'The import did not complete because of the following errors:'
  end

end


