
describe 'Punk API tests' do

  before(:all) do
    beer = PunkApi.new
    @ran = beer.random_beer_call
    @id = beer.beer_call(1)
    @params = beer.beer_params(brewed_before=11-2012)

  end

  it 'should have beer name as a string' do
    expect(@ran['name']).to be_a(String)
  end

  it 'should be able to test for beers by id' do
    expect(@id['name']).to be_a(String)
  end

  it 'should be able to search via parameters' do
    p @params
    # expect(@params['name']).to be_a(String)
  end

end
