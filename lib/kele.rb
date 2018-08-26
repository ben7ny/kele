class Kele
  require 'httparty'
  include HTTParty

  def initialize(email, password)
    @bloc_base_api_url = "https://www.bloc.io/api/v1"

    options = {
      body: {
        email:    email,
        password: password
      }
    }
    response = self.class.post("#{@bloc_base_api_url}/sessions", options)
    if response["auth_token"]
      @auth_token = response["auth_token"]
    else
      raise response["message"]
    end
  end

  def get_me
    response = self.class.get(
      "#{@bloc_base_api_url}/users/me",
      headers: { "authorization" => @auth_token }
    )
  end

end



