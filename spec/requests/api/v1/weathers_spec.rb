require 'rails_helper'

RSpec.describe 'Weathers', type: :request do
  it 'returns status 200' do
    get search_api_v1_weathers_path

    expect(response).to have_http_status(:ok)
  end
end
