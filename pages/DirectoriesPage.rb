class DirectoriesPage
  include Capybara::DSL
  include NavigationBar
 
  def initialize
  
  end

  def select_directory_type(type)

    #  Need to add additional code for when directories have already been configured

    find(:xpath, ".//*[contains(text(),'#{type}')]").click
  end 
end
