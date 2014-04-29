class LdapServer

  def initialize
    ldap_name = Time.now
    @dirIdentifier="LDAP_Server"+ldap_name.strftime("%Y%m%d+%T")
    @ol_directory = "LDAP #{ldap_name.strftime("%Y%m%d+%T")}"
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
