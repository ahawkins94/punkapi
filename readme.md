## ReadMe

### Synopsis
The aim of this project was to create a service that provides tests for the Punk API, found [here](https://punkapi.com/). To achieve this we coded in Ruby and used the gems HTTParty, JSON and RSpec.

The service has a couple of ways to run tests or retrieve data:
##### By ID
You can search the API by using the URL to target beers by their ID.
##### Random
You can use the API to call a random beer.
##### Query Parameters
Using Punk APIs parameters, you can target beers using the provided parameters (e.g. abv_gt, hops).
##### All
Run tests through or pull all of the data from the API.

### Install
<pre>gem install httparty
gem install json
gem install rspec</pre>

Create your folder and run <code>rspec --init</code> to initialize rspec. Within the newly created spec folder, create files object.rb and _spec.rb.

In the spec_helper.rb file, add <code>require_relative '(chosen name of object file).rb'</code>.


### Example

In the object file, we should have something similar to this:

```
require 'httparty'
require 'json'

class PunkApi

  include HTTParty

  def beer_call(id)
    id = JSON.parse(self.class.get("/beers/#{id}").body)
    id[0]

  end
end```
This allows us to call a beer from PunkAPI by the ID in the url

### Tests

Tests are found in the _spec file an example is:

```
describe 'Punk API tests' do

  before(:all) do
    beer = PunkApi.new
    @id = beer.beer_call(1)
  end

  it 'should be able to check whether name is a string' do
    expect(@id['name']).to be_a(String)
  end
end```

This test will check the beer with an ID of 1 and check to see if the value of the key 'name' is a string.
