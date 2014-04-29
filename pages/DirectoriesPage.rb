class DirectoriesPage
  include Capybara::DSL
  include NavigationBar
 
  def initialize
  
  end

  def select_directory_type(type)
    $log.debug("Searching for #{type}")
    if page.has_selector?(:xpath, './/*[@class="btn btn-primary"]')
      find(:xpath, './/*[@class="btn btn-primary"]').click
    end  
    find(:xpath, ".//*[contains(text(),'#{type}')]").click
  end 

end
