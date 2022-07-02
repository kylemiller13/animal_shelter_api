require 'rails_helper'

describe "delete an animal route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 20)}
  before do
    @animals_id = Animal.first.id
    delete "/api/v1/animals/#{@animals_id}"
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns an deleted success status message' do
    expect(JSON.parse(response.body)['message']).to eq("This animal has been deleted successfully.")
  end
end