require 'httparty'
require 'json'

class PunkApi
  include HTTParty

  attr_accessor :uri

  def initialize
    @uri = ""
  end
  base_uri 'https://api.punkapi.com/v2'

  def random_beer_call
    ran = JSON.parse(self.class.get("/beers/random").body)
    ran[0]
  end

  def beer_call(id)
    id = JSON.parse(self.class.get("/beers/#{id}").body)
    id[0]
  end

  def beers(opt = {})
    if opt.empty? == false
      @uri << '?'
      opt.each do |k,v|
        @uri << "#{k}=#{v}"

        query_resp = JSON.parse(self.class.get("/beers#{uri}"))
      end
    else
      response = JSON.parse(self.class.get('/beers').body)
      response[0]
    end
  end

end

kc = PunkApiService.new

kc.beers({"yeast" => "american", "abv_gt" => 4})

puts kc_uri
