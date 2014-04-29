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
    if page.has_selector?(:xpath, './/*[@class="grayfield tiny token-field"]')
      installation_token = find(:xpath, './/*[@class="grayfield tiny token-field"]').text
    else
      find(:xpath,'.//*[@class="directory_connector"]//*[@class="span4 name"]').click
      installation_token = find(:xpath, './/*[@class="grayfield tiny token-field"]').text
    end
    p installation_token 
    return installation_token
  end

end
