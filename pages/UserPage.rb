class UserPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
    super
  end 


  def add_privilege(privilege)
    find(:id, 'user-privileges').click
    $log.debug("Giving User '#{privilege}' privilege") 
    within(:id, 'popup_content'){
      find(:xpath, './/*[@class="select2-choice"]').click
    }
    text = find(:xpath, './/*[@id="s2id_operation_id"]//*[@class="select2-chosen"]').text
    if text == privilege
      find(:xpath, './/*[@value="Continue"]').click
    end
    sleep 1

  end

end
