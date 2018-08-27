class Kele
  require 'httparty'
  include HTTParty
  require "./lib/roadmap.rb"
  include Roadmap
  require "./lib/message.rb"
  include Message


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
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(
      "#{@bloc_base_api_url}/mentors/#{mentor_id}/student_availability",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end

end



