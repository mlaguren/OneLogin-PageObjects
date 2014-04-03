class Privileges
  include Capybara::DSL

  def initialize
    within(:id, 'privileges-index-partial'){
    array = all(:xpath, ".//*[@class='table privileges']/tbody//td")
    @entries = array.map {|value| value.text}
    }
  end

  def entries
    return @entries
  end
  
end
