
describe 'Punk API tests' do

  before(:all) do
    beer = PunkApi.new
    @params = beer.beer_params({"yeast" => "american", "abv_gt" => 20})
    @ran = beer.random_beer_call
    @id = beer.beer_call(1)
  end

  it 'should have beer name as a string' do
    expect(@ran['name']).to be_a(String)
  end

  it 'should be able to test for beers by id' do
    expect(@id['name']).to be_a(String)
  end

  it 'should be able to search via parameters' do
    expect(@params['name']).to be_a(String)
  end

  it 'has the image saved as a png' do

    expect((@params['image_url'])[-4..-1]).to eq(".png")
  end
end
