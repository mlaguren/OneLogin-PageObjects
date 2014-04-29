class LdapConnectorPage
  include Capybara::DSL
  include NavigationBar
 
  def initialize
  
  end

  def enter_directory_name(ldap_directory)
    find(:xpath,'.//*[@class="input-medium"]').set ldap_directory.directory_name
    find(:xpath,'.//*[@class="btn btn-primary editable-submit"]').click
    find(:xpath, ".//*[@class='editable editable-click']").text.should == ldap_directory.directory_name

    fill_in('directory_name', :with => ldap_directory.onelogin_directory)
    
    click_on('Save')
  end 

  def get_installation_token
    unless find(:xpath, './/*[@class="grayfield tiny token-field"]').nil?
      find(:xpath,'.//*[@class="directory_connector"]').click
    end
    installation_token = find(:xpath, './/*[@class="grayfield tiny token-field"]').text
    p installation_token 
  end

end
