class PasswordPage
  include Capybara::DSL


  def initialize
    @new_password=Password.pronounceable
  end
  
  def enter_new_password
    fill_in('password', :with => @new_password)
    p "#{@new_password}"
    find(:xpath, ".//*[@id='quickstart_form']/div[2]/input").click
    
  end
end
