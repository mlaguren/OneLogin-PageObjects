class NewUserPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL
  
  def initialize
    @firstName = {"selector" => :id, "value" => "user_firstname"}
    @lastName = {"selector" => :id, "value" => "user_lastname"}
    @email = {"selector" => :id, "value" => "user_email"}
  
  end

  def enter_basic_user (created_user)
    fill_in(@firstName['value'], :with => created_user.first_name)
    fill_in(@lastName['value'], :with => created_user.last_name)
    fill_in(@email['value'], :with => created_user.email)
  end

  def enter_user_with_apostrophe(created_user)

    new_last_name=created_user.last_name+"'"

    fill_in(@firstName['value'], :with => created_user.first_name)
    fill_in(@lastName['value'], :with => new_last_name)
    fill_in(@email['value'], :with => created_user.email)
 
  end

  def click_save
    find(:id, "save_user").click 
    find(:xpath, ".//*[@id='flashnotice']//*[@class='container']")
    find(:xpath, ".//*[@class='btn btn-primary disabled']")
  end

  def click_cancel
    click_link("Cancel")
  end

end

