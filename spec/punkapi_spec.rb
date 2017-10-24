
describe 'Punk API tests' do

  before(:all) do
    beer = PunkApi.new
    @params = beer.beer_params({"yeast" => "american", "abv_gt" => 20})
    @ran = beer.random_beer_call
    @id = beer.beer_call(1)
    @all = beer.all_beers
  end

# Test random beers
  it 'should have beer name as a string' do
    expect(@ran['name']).to be_a(String)
  end

  it 'has volume as an integer' do
    expect(@ran['volume']['value']).to be_a(Integer)
  end

# Test beers by ID
  it 'should be able to test for beers by id' do
    expect(@id['name']).to be_a(String)
  end

# Test beers by searching url parameters
  it 'should be able to search via parameters' do
    expect(@params['name']).to be_a(String)
  end

# Test all beers
  it 'should be able to test all beers' do
    @all.each do |i|
      expect(i['name']).to be_a(String)
    end
  end

  it 'has the image saved as a png' do
    @all.each do |i|
      expect((i['image_url'])[-4..-1]).to eq(".png")
    end
  end

  it 'has the date of first_brewed separated by a /' do
    @all.each do |i|
      expect((i['first_brewed'])[2]).to eq("/")
    end
  end
end
