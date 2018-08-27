module Message
  def get_messages(page=1)
    response = self.class.get(
      "#{@bloc_base_api_url}/message_threads",
      headers: { "authorization" => @auth_token, "page" => page.to_s }
    )
    JSON.parse(response.body)
  end

end



