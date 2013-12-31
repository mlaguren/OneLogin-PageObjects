# This class represents the OneLogin home page:
# http://app.onelogin.com

class HomePage
  include Capybara::DSL
  
# Define elements for interaction
  def initialize
    @url = $SETUP['url']
    @sign_up = {"selector" => :id, "value" => "nav-signup"}
  end
  
  def login_as (email, password)
  end
  
  def go_to_downloads
    find_link('downloads').click
  end
  
  def go_to_privacy
    find_link('privacy').click
  end

  def is_present
    find(@email_fld['selector'], @email_fld['value'])
    find(@password_fld['selector'], @password_fld['value'])
    page.has_title? @title 
  end  
end
