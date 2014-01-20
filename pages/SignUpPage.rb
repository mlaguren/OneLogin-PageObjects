class SignUpPage
  include Capybara::DSL
  include SiteNav

  def initialize
    @headline = {"selector" => :id, "value" => "headline"}
    super
  end
  
  ["firstname", "lastname", "company", "email", "phone"].each do |field|
    define_method("enter_your_#{field}") do |text|
      fill_in("#{field}", :with => text) 
    end
  end

  def register_new_company
    admin=User.new
    enter_your_firstname admin.first_name
    enter_your_lastname admin.last_name
    enter_your_company admin.company
    enter_your_email admin.email
    select('10-49',:from => 'orgsize')
    enter_your_phone admin.phone
    admin.save_to_file(admin,"#{$admin_user_file}")
  end

  def terms(action)
    action == "agree" ? check('terms') : uncheck('terms') 
  end
  
  def sign_up
    find(:id, 'submit-btn').click 
  end
end 
