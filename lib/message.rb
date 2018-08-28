module Message
  def get_messages(page=1)
    response = self.class.get(
      "#{@bloc_base_api_url}/message_threads",
      headers: { "authorization" => @auth_token, "page" => page.to_s }
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



