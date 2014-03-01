# This class represents the OneLogin login page:
# http://app.onelogin.com

class LoginPage
  include Capybara::DSL
  
# Define elements for interaction
  def initialize
    @email_fld = {"selector" => :id, "value"=>"email"}
    @password_fld = {"selector" => :id, "value" => "password"}
    @login_btn = {"selector" => :id, "value" => "login"}
    @warning = {"selector" => :id, "value" => "notice"}
    @title = "OneLogin"
    @url = ENV['URL']
  end
  
  def login_as (email, password)
    visit @url
    p current_url
    fill_in(@email_fld['value'], :with => email)
    fill_in(@password_fld['value'], :with => password)
    click_button(@login_btn['value'])  
  end
  
  def has_error_message
    find(@error['selector'], @error['value']).text.should match "Invalid username or password"
  end
  
  def forgot_password
    click_link('forgot_password')
  end

  def receive_inactivity_warning
    windows = page.driver.browser.window_handles
    if windows.length > 1
      focus = windows.last
      page.driver.browser.switch_to.window(focus)
    end
    notice = find(:id, "notice")
    notice.text.should == "You have been logged out due to inactivity."
    find(:id, "email")
  end

  # @deprecated
  def request_a_new_password
    find_link('request a new one').click
  end

  # @deprecated
  def go_to_support
    find_link('support').click
  end

  # @deprecated
  def go_to_downloads
    find_link('downloads').click
  end

  # @deprecated
  def go_to_privacy
    find_link('privacy').click
  end

  def is_present
    find(@email_fld['selector'], @email_fld['value'])
    find(@password_fld['selector'], @password_fld['value'])
    page.has_title? @title 
  end
  
end
