require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'returns a successful response' do
      get root_path
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get root_path
      expect(response).to render_template(:index)
    end
  end
end
