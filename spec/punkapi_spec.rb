
describe 'Punk API tests' do

  before(:all) do
    beer = PunkApi.new
    @api = beer.random_beer_call
  end

  it 'should say there is one more test' do
    p @api
  end

end
