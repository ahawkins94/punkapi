require 'httparty'
require 'json'

class PunkApi
  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  def random_beer_call
    JSON.parse(self.class.get("/beers/random").body)
  end

end
