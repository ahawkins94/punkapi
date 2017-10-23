
describe 'Punk API tests' do

  before(:all) do
    beer = PunkApi.new
    @api = beer.random_beer_call
  end

  it 'should have beer name as a string' do
    expect(@api[0]['name']).to be_a(String)
  end

end
