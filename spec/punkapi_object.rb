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

  def all_beers
    all = JSON.parse(self.class.get("/beers").body)
  end

  def beer_call(id)
    id = JSON.parse(self.class.get("/beers/#{id}").body)
    id[0]
  end

  def beer_params(opt = {})
    if opt.empty? == false
      num_keys = 0
      @uri << "?"
      opt.each do |k,v|
        @uri << "#{k}=#{v}"
        while num_keys < opt.keys.length - 1
          @uri << "&"
          num_keys += 1
        end
        end
      params = JSON.parse(self.class.get("/beers#{@uri}").body)
      params[0]
    end
  end
end
