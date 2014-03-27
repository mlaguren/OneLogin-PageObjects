class NewMappingsPage
  include Capybara::DSL
  
  def initialize
    find(:xpath,".//*[@class='input-medium']")[:placeholder].should == 'Untitled Mapping' 
  end

  def create_blank_mapping
    find(:xpath, ".//*[@class='btn btn-primary editable-submit']").click
    click_button('Save')
  end

  def enter_mapping_name(name)
    find(:xpath, ".//*[@class='input-medium']").set name
    find(:xpath, ".//*[@class='btn btn-primary editable-submit']").click
    find(:xpath, ".//*[@class='editable editable-click']").text.should == name
  end

  def create_new_mapping
    mapping="mapping"+Time.now.to_s
    enter_mapping_name(mapping)
    click_button('Save')
    find(:xpath, ".//*[@id='flashnotice']//*[@class='container']").text.should == 'Mapping was successfully created.'
    $log.debug("#{mapping} mapping created")
    find(:id, 'reapply_link')
    return mapping
  end

end
