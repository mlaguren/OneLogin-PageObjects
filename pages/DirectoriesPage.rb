class DirectoriesPage
  include Capybara::DSL
  include NavigationBar
 
  def initialize
  
  end

  def select_directory_type(type)
    unless (find(:xpath, './/*[@class="btn btn-primary"]').nil?)
      find(:xpath, './/*[@class="btn btn-primary"]').click
    end  
    find(:xpath, ".//*[contains(text(),'#{type}')]").click
  end 

end
