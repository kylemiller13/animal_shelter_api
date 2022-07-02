require 'rails_helper'

describe "get all animals route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 8)}

  it 'returns all animals' do
    get '/api/v1/animals'
    expect(JSON.parse(response.body).size).to eq(8)
  end
  
  it 'returns status code 200' do
    get '/api/v1/animals'
    expect(response).to have_http_status(:success)
  end
end

describe "get animal by search", :type => :request do 

  let!(:animals) { FactoryBot.create_list(:animal,20)} 

  before do 
    post '/api/v1/animals', params: { :name => 'jorge', :sex => "male", :breed => "bulldog", :age => 20 }
  end

  it 'returns an animal by name' do
    get '/api/v1/animals?name=jorge'
    expect(JSON.parse(response.body)[0]['name']).to eq('Jorge')
  end

  it 'returns an animal by sex' do 
    get '/api/v1/animals?sex=male'
    expect(JSON.parse(response.body)[0]['sex']).to eq('Male')
  end

  it 'returns an animal by breed' do 
    get '/api/v1/animals?breed=bulldog'
    expect(JSON.parse(response.body)[0]['breed']).to eq('bulldog')
  end

  it 'returns an animal by age' do 
    get '/api/v1/animals?age=20'
    expect(JSON.parse(response.body)[0]['age']).to eq(20)
  end
end
