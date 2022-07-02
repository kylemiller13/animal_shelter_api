require 'rails_helper'

describe "post a animal route", :type => :request do

  before do 
    post '/api/v1/animals', params: {:name => 'Jorge', :sex => "male", :breed => "bulldog", :age => 20 }
  end

  it 'returns the animal name' do
    expect(JSON.parse(response.body)['name']).to eq('Jorge')
  end

  it 'returns the animal sex' do
    expect(JSON.parse(response.body)['sex']).to eq('male')
  end

  it 'returns the animal breed' do
    expect(JSON.parse(response.body)['breed']).to eq('bulldog')
  end

  it 'returns the animal age' do
    expect(JSON.parse(response.body)['age']).to eq(20)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end