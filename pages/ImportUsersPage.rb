class ImportUsersPage
  include Capybara::DSL

  def initialize

  end

  def upload_csv
    p Dir.getwd + '/test.csv'
    sleep 2
    page.driver.browser.all(:xpath, ".//*[@class='file-input-wrapper btn']/input")[0].send_keys(Dir.getwd + '/test.csv')
    click_button('Upload')
  end

end
