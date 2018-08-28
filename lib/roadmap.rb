module Roadmap
  def get_roadmap(chain_id)
    response = self.class.get(
      "#{@bloc_base_api_url}/roadmaps/#{chain_id}",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(
      "#{@bloc_base_api_url}/checkpoints/#{checkpoint_id}",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end

  def get_remaining_checkpoints(chain_id)
    response = self.class.get(
      "#{@bloc_base_api_url}/enrollment_chains/#{chain_id}/checkpoints_remaining_in_section",
      headers: { "authorization" => @auth_token }
    )
    JSON.parse(response.body)
  end

end



