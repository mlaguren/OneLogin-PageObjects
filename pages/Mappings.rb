class MappingsPage
  include Capybara::DSL
  
  def initialize
  
  end

  def create_new_mapping
    click_link('New Mapping') 
  end

  def mapping_is_enabled(mapping_name)
    mappings=page.all(:xpath, "(.//*[@id='main-content']//*[@class='span12'])[1]//tbody/tr/td[1]")
    found="false"
    mappings.each do |mapping|
      if mapping.text == mapping_name
        found="true"
        $log.debug("#{mapping_name} mapping was found")
      end
    end
    found.should == "true"
  end

end
