require 'httparty'
require 'json'

class PunkApi
  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  def random_beer_call
    ran = JSON.parse(self.class.get("/beers/random").body)
    ran[0]
  end

  def beer_call(id)
    id = JSON.parse(self.class.get("/beers/#{id}").body)
    id[0]
  end

  def beer_params(beers_array)
    JSON.parse(self.class.post("/beers?", body: {"params" => beers_array}).body)
  end

end
