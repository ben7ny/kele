module Message
  def get_messages(page=nil)
    options = {
       headers: {"authorization" => @auth_token}
    }
    if page
      options.merge!({body: {"page" => page}})
    end
    response = self.class.get(
      "#{@bloc_base_api_url}/message_threads", options
    )
    JSON.parse(response.body)
  end

  def create_message(message, recipient_id)
    options = {
      body: {
        "sender" => @current_user_email,
        "stripped-text" => message.strip,
        "recipient_id" => recipient_id.to_s
      },
      headers: {
        "authorization" => @auth_token,
        "Content-Type" => "application/json"
      }
    }

    response = self.class.post(
      "#{@bloc_base_api_url}/messages", options
    )
  end

end



