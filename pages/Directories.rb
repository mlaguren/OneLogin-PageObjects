class DirectoriesPage
  include Capybara::DSL
  include NavigationBar
 
  def initialize
  
  end

  def select_directory_type(type)

    find(:xpath, './/*[contains(text(),"LDAP via Connector")]').click
  end 
end
