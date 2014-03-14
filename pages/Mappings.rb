class MappingsPage
  include Capybara::DSL
  
  def initialize
  
  end

  def create_new_mapping
    click_link('New Mapping') 
  end

end
