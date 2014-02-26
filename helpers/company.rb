class Company

  def initialize
    @address1=Faker::Address.street_address
    @address2=Faker::Address.secondary_address
    @city=Faker::Address.city
    @state=Faker::Address.state
    @zip=Faker::Address.zip_code
  end

  def address1
    return @address1
  end

  def address2
    return @address2
  end

  def city
    return @city
  end  

  def state
    return @state 
  end

  def zip
    return @zip
  end
  
  def to_json
    {'address1'=>@address1, 'address2' => @address2, 'city' => @city, 'state' => @state, 'zip' => @zip}.to_json
  end

  def save_to_file(user, filename)
      p user
      p filename
      File.open("logfiles/company/"+filename,"w") do |f|
        f.write(company.to_json)
      end   
  end

end  
    
