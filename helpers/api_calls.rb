class API_CALLS
  def get_all_users
    c = Curl::Easy.new("https://app.onelogin.us/api/v2/users.xml")
    c.http_auth_types = :basic
    c.username = "#{@api_key}"
    c.password = "x"
    c.perform
    message =  c.body_str
    return message
  end
end

