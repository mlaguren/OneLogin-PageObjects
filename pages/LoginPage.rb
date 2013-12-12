# This class represents the OneLogin login page:
# http://app.onelogin.com

class LoginPage
  include Capybara::DSL
  
  def initialize
    @url = $SETUP['url']
    @email_fld = {"selector" => :id, "value"=>"email"}
    @password_fld = {"selector" => :id, "value" => "password"}
    @login_btn = {"selector" => :id, "value" => "login"}
  end
  
  def login_as (email, password)
    visit @url
    fill_in(@email_fld['value'], :with => email)
    fill_in(@password_fld['value'], :with => password)
    click_button(@login_btn['value'])  
  end
  
  def has_error_message
    find('errors').text.should = "Invalid username or password"
  end
  
  def forgot_password
    click_link('forgot_password')
  end
  
  def request_a_new_password
    find_link('request a new one').click
  end
  
  def go_to_support
    find_link('support').click
  end
  
  def go_to_downloads
    find_link('downloads').click
  end
  
  def go_to_privacy
    find_link('privacy').click
  end
  
end
