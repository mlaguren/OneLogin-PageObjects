class UserPage
  include UserMenu
  include NavigationBar
  include Capybara::DSL

  def initialize
    super
  end 


  def add_privilege(privilege)
    find(:id, 'user-privileges').click
    within(:id, 'popup_content'){
      find(:xpath, './/*[@class="select2-choice"]').click
    }
    text = find(:xpath, './/*[@id="s2id_operation_id"]//*[@class="select2-chosen"]').text
    sleep 5
  end

end
