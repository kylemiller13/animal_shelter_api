require 'rails_helper'

describe "update a animal route", :type => :request do 
  let!(:animals) { FactoryBot.create_list(:animal, 20)}

  before do
    put "/api/v1/animals/#{Animal.first.id}", params: { :name => 'Jorge', :sex => "male", :breed => "bulldog", :age => 20 }
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns updated status message' do
    expect(JSON.parse(response.body)['message']).to eq("This animal has been updated successfully.")
  end

  it 'should have a new name, sex, breed, age' do
    expect(Animal.first.name).to eq('Jorge')
    expect(Animal.first.sex).to eq('male')
    expect(Animal.first.breed).to eq('bulldog')
    expect(Animal.first.age).to eq(20)
  end
end