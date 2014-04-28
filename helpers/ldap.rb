class User

  def initialize
    @dirIdentifier="Test"
    @ol_directory = "test"
  end

  def directory_name
    return @dirIdentifier
  end

  def onelogin_directory
    return @ol_directory
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
