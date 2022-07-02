require 'rails_helper'

describe 'get a animals route with exception handler', :type => :request do

  before { get '/api/v1/animals/200' }

  it 'returns a RecordNotFound error' do
    expect(response).to have_http_status(:not_found)
  end

end

describe 'post a animals route with exception handlers', :type => :request do

  before do
    post '/api/v1/animals', params: { :name => 'Jorge', :sex => "male", :breed => nil, :age => 20 }
  end

  it 'returns a RecordInvalid error' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end