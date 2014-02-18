class User

  def initialize
    @first=Faker::Name.first_name
    @last=Faker::Name.last_name
    @company="OneLogin Test"
    @phone=Faker::PhoneNumber.phone_number
  end

  def first_name
    return @first
  end

  def last_name
    return @last
  end

  def company
    return @company
  end  

  def email
    @email_address = "#{@first.downcase}.#{@last.downcase}.38a1661e@mailosaur.in"
    return @email_address  
  end

  def phone 
    return @phone
  end
  
  def to_json
    {'first'=>@first, 'last' => @last, 'company' => 'OneLogin Test', 'password' => :null, 'email' => self.email, 'phone' => @phone}.to_json
  end

  def save_to_file(user, filename)
      p user
      p filename
      File.open("logfiles/users/"+filename,"w") do |f|
        f.write(user.to_json)
      end   
  end

end  
    
