class NewMappingsPage
  include Capybara::DSL
  
  def initialize
    find(:xpath,".//*[@class='input-medium']")[:placeholder].should == 'Untitled Mapping' 
  end

  def create_blank_mapping
    find(:xpath, ".//*[@class='btn btn-primary editable-submit']").click
    click_button('Save')
  end

end
