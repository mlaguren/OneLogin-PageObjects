class CompanyInfoPage
  include Capybara::DSL
  include UserMenu
  include NavigationBar

  def initialize

  end

  def verify_account_owner(owner)
    find(:xpath, ".//*[@id='s2id_account_owner_user_id']//*[@class='select2-chosen']").text.should == owner
  end

  def verify_company_name(company_name)
    find(:id, 'account_name').value.should == company_name
  end

  def update_company_address(address)
    address.each do |field|
      fill_in(field[0], :with => "#{field[1]}") 
    end
  end

  def save_company_info
    click_button("Save")
    find(:id, "flashes")
    find(:xpath, ".//*[@class='btn btn-primary disabled']")
  end

  def verify_address(address)
    address.each do |field|
      find(:id, field[0]).value.should == field[1]
    end
  end

end
