class SendInvitation < PopUp
  include Capybara::DSL

  def initialize
    super   
  end
  
  def verify_users_email(email)  
    within(:id, 'popup_content') do
      set_email = find(:id, 'email')
      
      set_email.value.should == email
    end
  end

  def send_invite
    click_button('Send')
  end

  def close_popup
    click_button('Close')
  end

end
